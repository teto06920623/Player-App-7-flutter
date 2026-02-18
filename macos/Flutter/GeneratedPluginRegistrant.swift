//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

import audio_session
import audioplayers_darwin
import just_audio
import just_waveform
import record_macos

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  AudioSessionPlugin.register(with: registry.registrar(forPlugin: "AudioSessionPlugin"))
  AudioplayersDarwinPlugin.register(with: registry.registrar(forPlugin: "AudioplayersDarwinPlugin"))
  JustAudioPlugin.register(with: registry.registrar(forPlugin: "JustAudioPlugin"))
  JustWaveformPlugin.register(with: registry.registrar(forPlugin: "JustWaveformPlugin"))
  RecordMacOsPlugin.register(with: registry.registrar(forPlugin: "RecordMacOsPlugin"))
}
