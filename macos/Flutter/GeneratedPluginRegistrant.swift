//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

import audio_session
import just_audio
import path_provider_macos
import sqflite
import audio_service

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  AudioSessionPlugin.register(with: registry.registrar(forPlugin: "AudioSessionPlugin"))
  JustAudioPlugin.register(with: registry.registrar(forPlugin: "JustAudioPlugin"))
  PathProviderPlugin.register(with: registry.registrar(forPlugin: "PathProviderPlugin"))
  SqflitePlugin.register(with: registry.registrar(forPlugin: "SqflitePlugin"))
  AudioServicePlugin.register(with: registry.registrar(forPlugin: "AudioServicePlugin"))
}