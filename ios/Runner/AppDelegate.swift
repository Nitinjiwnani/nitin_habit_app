import UIKit
import Flutter

@main
@objc class AppDelegate: FlutterAppDelegate {
    private let CHANNEL = "com.example.nitin_habit_app/toast"

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        guard let controller = window?.rootViewController as? FlutterViewController else {
            fatalError("Root view controller is not a FlutterViewController")
        }

        let methodChannel = FlutterMethodChannel(name: CHANNEL, binaryMessenger: controller.binaryMessenger)
        
        methodChannel.setMethodCallHandler { [weak self] (call, result) in
            if call.method == "showToast" {
                if let args = call.arguments as? [String: Any],
                   let message = args["message"] as? String {
                    self?.showToast(message: message)
                    result(nil)
                } else {
                    result(FlutterError(code: "INVALID_ARGUMENT", message: "Expected a message argument", details: nil))
                }
            } else {
                result(FlutterMethodNotImplemented)
            }
        }
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    private func showToast(message: String) {
        DispatchQueue.main.async {
            guard let rootViewController = UIApplication.shared.windows.first?.rootViewController else {
                return
            }
            
            let toast = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            toast.view.alpha = 0.8
            toast.view.layer.cornerRadius = 15

            rootViewController.present(toast, animated: true)

            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                toast.dismiss(animated: true)
            }
        }
    }
}
