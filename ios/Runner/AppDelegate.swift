import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)
    FileProtectionChannel.register(with: engineBridge.applicationRegistrar.messenger())
  }
}

/// Applies NSFileProtectionCompleteUntilFirstUserAuthentication to sandboxed media files.
enum FileProtectionChannel {
  static let name = "com.transitionjournal/file_protection"

  static func register(with messenger: FlutterBinaryMessenger) {
    let channel = FlutterMethodChannel(name: name, binaryMessenger: messenger)
    channel.setMethodCallHandler { call, result in
      guard call.method == "setCompleteUntilFirstUnlock",
            let args = call.arguments as? [String: Any],
            let path = args["path"] as? String else {
        result(FlutterMethodNotImplemented)
        return
      }
      do {
        try FileManager.default.setAttributes(
          [.protectionKey: FileProtectionType.completeUntilFirstUserAuthentication],
          ofItemAtPath: path
        )
        result(nil)
      } catch {
        result(
          FlutterError(
            code: "file_protection_failed",
            message: "Could not apply file protection",
            details: nil
          )
        )
      }
    }
  }
}
