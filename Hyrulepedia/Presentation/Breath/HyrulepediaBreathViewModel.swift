import Foundation
import Combine
import SwiftUI

/// View model for the `HyrulepediaBreath` section.
///
///
/// This type is annotated with `@MainActor` because it updates `@Published`
/// properties that drive SwiftUI views.
@MainActor
final class HyrulepediaBreathViewModel: ObservableObject, HyrulepediaCrossFooterSectionContract {

    // MARK: - Published

    /// Currently selected category name for the Breath section.
    @Published public var listCategory = ""
    /// Current search query text entered by the user.
    @Published public var searchText = ""
    /// Indicates whether a data load operation is in progress.
    @Published public var isLoading = true
    /// All items fetched for the selected game (Breath of the Wild).
    @Published public var items: [HyrulepediaDataEntity] = []
    /// Indicates whether a data load operation fails.
    @Published public var isError = false

    // MARK: - Dependencies

    /// Use case responsible for retrieving items for a given game.
    private let useCase: GetAllItemsUseCaseContract

    // MARK: - Initializers

    /// Creates a view model with an explicitly provided dependency.
    /// - Parameter useCase: The use case used to fetch items.
    init(useCase: GetAllItemsUseCaseContract) {
        self.useCase = useCase
    }

    /// Convenience initializer that resolves dependencies from `DomainDependencies`.
    /// Useful for app composition and SwiftUI previews when you don't need to
    /// inject a custom implementation of the dependency.
    convenience init() {
        self.init(useCase: DomainDependencies.getAllItemsUseCase)
    }

    // MARK: - Lifecycle

    /// Call when the view appears to trigger the initial data load.
    ///
    /// Loads items for Breath of the Wild (gameId "1").
    func notifyAppearance() async {
        await loadData(gameId: "1")
    }
    
    // MARK: - User Intents

    /// Updates the selected category.
    /// - Parameter category: The category name to select.
    func categorySelected(category: String) {
        self.listCategory = category
    }
    
    /// Updates the current search text.
    /// - Parameter text: The new search query.
    func changeInputText(text: String) {
        self.searchText = text
    }

    // MARK: - Data Loading

    /// Loads all items for the specified game.
    /// - Parameter gameId: The identifier of the game to load items for. "1" corresponds to Breath of the Wild.
    /// - Note: Sets `isLoading` to true while fetching and resets it when finished.
    ///         If no category is selected, this method will default it to the first item's category.
    func loadData(gameId: String) async {
        self.isLoading = true
        self.isError = false
        do {
            let fetched = try await self.useCase.getItems(gameId: gameId)
            self.items = fetched
            if self.listCategory.isEmpty, let firstCategory = fetched.first?.category {
                self.listCategory = firstCategory
            }
            self.isLoading = false
            self.isError = false
            print("Loaded \(self.items.count) items")
        } catch is CancellationError {
            self.isLoading = false
        } catch {
            self.isError = false
            print("Error loading items:", error)
            self.isLoading = false
        }
    }
}
