//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

import cloud_firestore
import firebase_auth
import firebase_core
import firebase_ml_model_downloader

import shared_preferences_foundation
import path_provider_foundation
import tflite_flutter_helper


func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  FLTFirebaseFirestorePlugin.register(with: registry.registrar(forPlugin: "FLTFirebaseFirestorePlugin"))
  FLTFirebaseAuthPlugin.register(with: registry.registrar(forPlugin: "FLTFirebaseAuthPlugin"))
  FLTFirebaseCorePlugin.register(with: registry.registrar(forPlugin: "FLTFirebaseCorePlugin"))
  FirebaseModelDownloaderPlugin.register(with: registry.registrar(forPlugin: "FirebaseModelDownloaderPlugin"))

  SharedPreferencesPlugin.register(with: registry.registrar(forPlugin: "SharedPreferencesPlugin"))
  PathProviderPlugin.register(with: registry.registrar(forPlugin: "PathProviderPlugin"))
  TfliteFlutterHelperPlugin.register(with: registry.registrar(forPlugin: "TfliteFlutterHelperPlugin"))

}
