import SwiftUI
import Combine

/// A simple, scalable navigation coordinator based on NavigationStack and an enum of routes.
final class NavigationCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    @Published var root: AppRoute = .gameSelector

    /// Push a new route
    func push(_ route: AppRoute) {
        path.append(route)
    }

    /// Replace the whole stack with a new root
    func setRoot(_ route: AppRoute) {
        root = route
        path = NavigationPath()
    }

    /// Pop last
    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }

    /// Pop to root
    func popToRoot() {
        path = NavigationPath()
    }
}
