import SwiftUI

/// Root container that hosts the NavigationStack and maps routes to views.
struct AppRootView: View {
    @ObservedObject private var coordinator: NavigationCoordinator

    init(coordinator: NavigationCoordinator = PresentationDependencies.navigationCoordinator) {
        self.coordinator = coordinator
    }

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
    @ViewBuilder
    func rootView(for route: AppRoute) -> some View {
        destination(for: route)
    }

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
