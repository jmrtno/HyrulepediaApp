import Foundation
import SwiftUI

/// Domain-layer dependency registry.
///
/// Provides shared instances for networking, repositories, and use cases.
/// These are intended for app-wide defaults; consider injecting alternatives
/// in tests or previews as needed.
enum DomainDependencies {
    /// Shared network service used by repositories to perform HTTP requests.
    ///
    /// - Note: Default implementation is `DefaultNetworkService`.
    static let network: NetworkService = DefaultNetworkService()

    /// Main repository for accessing Hyrulepedia data.
    ///
    /// Initialized with the shared `network` service.
    static let zeldaRepository = HyrulepediaRepository(network: network)

    /// Use cases

    /// Retrieves all items from the repository.
    ///
    /// Exposed via the `GetAllItemsUseCaseContract` abstraction.
    static let getAllItemsUseCase: GetAllItemsUseCaseContract =
        GetAllItemsUseCase(repository: zeldaRepository)

    /// Retrieves a single item by identifier from the repository.
    ///
    /// Exposed via the `GetItemUseCaseContract` abstraction.
    static let getItemUseCase: GetItemUseCaseContract =
        GetItemUseCase(repository: zeldaRepository)

}


/// Presentation-layer dependency registry.
///
/// Provides shared instances used by the UI layer, such as navigation coordination.
enum PresentationDependencies {
    /// Shared navigation coordinator that manages the app's navigation stack.
    static let navigationCoordinator = NavigationCoordinator()
}
