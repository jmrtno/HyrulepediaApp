import Combine
import Foundation

/// View model for the `HyrulepediaDetail` section.
///
///
/// This type is annotated with `@MainActor` because it updates `@Published`
/// properties that drive SwiftUI views.

@MainActor
final class HyrulepediaDetailViewModel: ObservableObject {
    
    // MARK: - Published
    
    @Published var item: HyrulepediaDataEntity = .init()
    /// Indicates whether a data load operation is in progress.
    @Published public var isLoading = true
    
    // MARK: - Dependencies
    
    /// Item Id for deatil data
    private let itemId: Int
    /// Game Id for item
    private let gameId: String
    /// Use case responsible for retrieving items for a given game.
    private let useCase: GetItemUseCaseContract

    // MARK: - Initializers
    
    /// Creates a view model with an explicitly provided dependency.
    /// - Parameters:
    ///  - useCase: The use case used to fetch items.
    ///  - itemId: Item Id for deatil data
    ///  - gameId: Game Id for item
    init(itemId: Int,
         gameId: String,
         useCase: GetItemUseCaseContract) {
        self.itemId = itemId
        self.gameId = gameId
        self.useCase = useCase
    }

    /// Convenience initializer that resolves the use case from `DomainDependencies`.
    /// - Parameters:
    ///   - itemId: Item Id for detail data
    ///   - gameId: Game Id for item
    convenience init(itemId: Int, gameId: String) {
        self.init(itemId: itemId, gameId: gameId, useCase: DomainDependencies.getItemUseCase)
    }

    /// This method is called when the view appears
    func notifyAppearance() async {
        await loadData()
    }
    
    /// Loads all items for the specified game.
    /// - Note: Sets `isLoading` to true while fetching and resets it when finished.
    private func loadData() async {
        self.isLoading = true
        do {
            let fetched = try await useCase.getItem(itemId: itemId, gameId: gameId)
            self.item = fetched
            print("Loaded item: \(self.item.name)")
            self.isLoading = false
        } catch {
            print("Error loading item:", error)
            self.isLoading = false
        }
    }
}
