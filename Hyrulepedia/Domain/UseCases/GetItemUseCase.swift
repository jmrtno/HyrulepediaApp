import Foundation

/// Contract for the use case that fetches a single Hyrulepedia item.
protocol GetItemUseCaseContract: Sendable {
    /// Fetches a single item by its ID and game ID.
    /// - Parameters:
    ///   - itemId: The unique identifier of the item.
    ///   - gameId: The identifier of the game context.
    /// - Returns: A `HyrulepediaDataEntity` representing the item.
    /// - Throws: Throws an error if fetching fails.
    func getItem(itemId: Int, gameId: String) async throws -> HyrulepediaDataEntity
}

/// Default implementation of `GetItemUseCaseContract`.
final class GetItemUseCase: GetItemUseCaseContract, @unchecked Sendable {
    /// Repository used to fetch data from the Hyrulepedia API.
    private let repo: HyrulepediaRepository

    /// Initializes the use case with a repository.
    /// - Parameter repository: Repository responsible for fetching Hyrulepedia data.
    required init(repository: HyrulepediaRepository) {
        self.repo = repository
    }

    /// Fetches a single item using the repository.
    /// - Parameters:
    ///   - itemId: The unique identifier of the item.
    ///   - gameId: The identifier of the game context.
    /// - Returns: A `HyrulepediaDataEntity` representing the item.
    /// - Throws: Throws an error if fetching fails.
    func getItem(itemId: Int, gameId: String) async throws -> HyrulepediaDataEntity {
        try await repo.getItem(itemId: itemId, gameId: gameId)
    }
}
