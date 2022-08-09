import SwiftUI

// MARK: - The App
@main
struct WakingLifeApp: App {

    var body: some Scene {
        WindowGroup {
            SplashScreen()
                .preferredColorScheme(.dark)
        }
    }
}
