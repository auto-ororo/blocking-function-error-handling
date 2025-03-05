import SwiftUI
import FirebaseCore
import FirebaseAuth

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    // Dummy options
    let options = FirebaseOptions(
        googleAppID: "1:123456789:ios:abcdef123456",
        gcmSenderID: "123456789"
    )
    options.apiKey = "dummy-api-key"
    FirebaseApp.configure(options: options)
      
    // Use emulator
    Auth.auth().useEmulator(withHost:"127.0.0.1", port:9099)

    return true
  }
}

@main
struct BlockingFunctionErrorHandlingSampleAppApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
