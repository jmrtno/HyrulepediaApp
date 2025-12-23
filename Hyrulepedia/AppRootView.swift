import SwiftUI

/// The root container for the app.
///
/// `AppRootView` embeds a `NavigationStack` whose `path` is managed by a shared
/// `NavigationCoordinator`. It translates `AppRoute` values into concrete SwiftUI
/// destinations and injects the coordinator into the environment so that child
/// views can trigger navigation.
struct AppRootView: View {
    /// Shared navigation coordinator that owns the stack path and root route.
    @ObservedObject private var coordinator: NavigationCoordinator

    /// Creates an instance of `AppRootView`.
    /// - Parameter coordinator: The navigation coordinator used to manage the
    ///   `NavigationStack`. Defaults to the shared instance provided by
    ///   `PresentationDependencies`.
    init(coordinator: NavigationCoordinator = PresentationDependencies.navigationCoordinator) {
        self.coordinator = coordinator
    }

    /// The view hierarchy that hosts the `NavigationStack` and maps routes to destinations.
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            rootView(for: coordinator.root)
                .navigationDestination(for: AppRoute.self) { route in
                    destination(for: route)
                }
        }
        .environmentObject(coordinator)
    }
}

private extension AppRootView {
    /// Returns the root view for the provided route.
    /// - Parameter route: The initial `AppRoute` to display as the root.
    /// - Returns: A type-erased view for the given route.
    @ViewBuilder
    func rootView(for route: AppRoute) -> some View {
        destination(for: route)
    }

    /// Resolves a destination view for the given route.
    /// - Parameter route: The `AppRoute` to navigate to.
    /// - Returns: A type-erased view representing the destination screen.
    @ViewBuilder
    func destination(for route: AppRoute) -> some View {
        switch route {
        case .gameSelector:
            HyrulepediaGameSelectorScreen()
        case .breathOfTheWild:
            HyrulepediaBreathScreen()
        case .tearsOfTheKingdom:
            HyrulepediaTearsScreen()
        }
    }
}

#Preview {
    AppRootView()
}
