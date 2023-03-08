import UIKit
import Flutter

class MyApi: NSObject, BookApi {
    func search(keyword: String) throws -> [Book?] {
       let result = Book(title: "\(keyword)'s Life", author: keyword)
        return [result]
    }
}

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    var flutterViewController : FlutterViewController!;
    var navigationController : UINavigationController!;

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      flutterViewController = window?.rootViewController as? FlutterViewController
      GeneratedPluginRegistrant.register(with: self)
      navigationController = UINavigationController(rootViewController: flutterViewController)
      navigationController.isNavigationBarHidden = true
      window?.rootViewController = navigationController
      window?.makeKeyAndVisible()
      
      let api = MyApi()
      BookApiSetup.setUp(binaryMessenger: flutterViewController.binaryMessenger, api: api)
      
      if #available(iOS 10.0, *) {
        UNUserNotificationCenter.current().delegate = self
      }
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
