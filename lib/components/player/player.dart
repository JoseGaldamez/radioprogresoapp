import 'dart:async';

import 'package:audio_service/audio_service.dart';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:radioprogresoappoficial/services/radio_service.dart';

class Player extends StatefulWidget {
  final AudioHandler audioHandler;
  Player({Key? key, required this.audioHandler}) : super(key: key);

  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: widget.audioHandler.playbackState
          .map((state) => state.playing)
          .distinct(),
      builder: (context, snapshot) {
        final playing = snapshot.data ?? false;
        //setPlaying(context, playing);
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (playing)
              //_button(Icons.pause, widget.audioHandler.stop )
              _button(Icons.pause, () {
                widget.audioHandler.stop();
                context.read<RadioService>().setPlaying(!playing);
              })
            else
              //_button(Icons.play_arrow, widget.audioHandler.play),
              _button(Icons.play_arrow, () {
                widget.audioHandler.play();
                context.read<RadioService>().setPlaying(!playing);
              }),
          ],
        );
      },
    );
  }

  void setPlaying(BuildContext context, bool state) {
    context.read<RadioService>().setPlaying(state);
  }

  IconButton _button(IconData iconData, VoidCallback onPressed) => IconButton(
        icon: Icon(iconData),
        iconSize: 64.0,
        onPressed: onPressed,
      );
}

class MediaState {
  final MediaItem? mediaItem;
  final Duration position;

  MediaState(this.mediaItem, this.position);
}

/// An [AudioHandler] for playing a single item.
class AudioPlayerHandler extends BaseAudioHandler with SeekHandler {
  static final _item = MediaItem(
    id: 'https://streamingcwsradio30.com:7045/stream?type=http&nocache=102',
    album: "Radio Progreso",
    title: "Radio Progreso",
    artist: "En vivo",
    duration: const Duration(milliseconds: 5739820),
    artUri: Uri.parse(
        'https://radioprogresohn.net/wp-content/uploads/2022/01/logo-radi-progreso.webp'),
  );

  final _player = AudioPlayer();

  /// Initialise our audio handler.
  AudioPlayerHandler() {
    // So that our clients (the Flutter UI and the system notification) know
    // what state to display, here we set up our audio handler to broadcast all
    // playback state changes as they happen via playbackState...
    _player.playbackEventStream.map(_transformEvent).pipe(playbackState);
    // ... and also the current media item via mediaItem.
    mediaItem.add(_item);

    // Load the player.
    _player.setAudioSource(AudioSource.uri(Uri.parse(_item.id)));
  }

  // In this simple example, we handle only 4 actions: play, pause, seek and
  // stop. Any button press from the Flutter UI, notification, lock screen or
  // headset will be routed through to these 4 methods so that you can handle
  // your audio playback logic in one place.

  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> seek(Duration position) => _player.seek(position);

  @override
  Future<void> stop() => _player.stop();

  /// Transform a just_audio event into an audio_service state.
  ///
  /// This method is used from the constructor. Every event received from the
  /// just_audio player will be transformed into an audio_service state so that
  /// it can be broadcast to audio_service clients.
  PlaybackState _transformEvent(PlaybackEvent event) {
    return PlaybackState(
      controls: [
        MediaControl.rewind,
        if (_player.playing) MediaControl.pause else MediaControl.play,
        MediaControl.stop,
        MediaControl.fastForward,
      ],
      systemActions: const {
        MediaAction.seek,
        MediaAction.seekForward,
        MediaAction.seekBackward,
      },
      androidCompactActionIndices: const [0, 1, 3],
      processingState: const {
        ProcessingState.idle: AudioProcessingState.idle,
        ProcessingState.loading: AudioProcessingState.loading,
        ProcessingState.buffering: AudioProcessingState.buffering,
        ProcessingState.ready: AudioProcessingState.ready,
        ProcessingState.completed: AudioProcessingState.completed,
      }[_player.processingState]!,
      playing: _player.playing,
      updatePosition: _player.position,
      bufferedPosition: _player.bufferedPosition,
      speed: _player.speed,
      queueIndex: event.currentIndex,
    );
  }
}
