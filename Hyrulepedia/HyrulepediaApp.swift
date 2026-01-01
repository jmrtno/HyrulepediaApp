import SwiftUI

@main
struct HyrulepediaApp: App {
    var body: some Scene {
        WindowGroup {
            AppRootView()
        }
    }
}

extension Color {
    static let customWhite = Color(red: 244/255,
                                   green: 250/255,
                                   blue: 250/255)
    static let customWhiteGlow = Color(red: 100/255,
                                   green: 200/255,
                                   blue: 255/255)
    static let customGold = Color(red: 185/255,
                                   green: 160/255,
                                   blue: 102/255)
    static let mintGreen = Color(red: 111/255,
                                 green: 212/255,
                                 blue: 156/255)
}
