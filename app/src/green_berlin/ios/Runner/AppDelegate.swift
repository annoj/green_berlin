import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    GMSServices.provideAPIKey("AIzaSyDxaCW3fRTR5MjwMhnzTfv_zPsM0Ll5-7A")

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}