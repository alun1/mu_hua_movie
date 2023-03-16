import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
    TalkingDataSDKPlugin.`init`("94AEA0CDD9F647C0BDE6F022B8D2583C", channelId: "ios", custom: "")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
