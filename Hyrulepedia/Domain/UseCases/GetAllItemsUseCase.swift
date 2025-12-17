import Foundation

/// Contract for the use case that fetches all Hyrulepedia items for a given game.
protocol GetAllItemsUseCaseContract: Sendable {
    /// Fetches all items for a specific game.
    /// - Parameter gameId: The identifier of the game.
    /// - Returns: An array of `HyrulepediaDataEntity` representing all items.
    /// - Throws: Throws an error if fetching fails.
    func getItems(gameId: String) async throws -> [HyrulepediaDataEntity]
}

/// Default implementation of `GetAllItemsUseCaseContract`.
final class GetAllItemsUseCase: GetAllItemsUseCaseContract, @unchecked Sendable {
    /// Repository used to fetch data from the Hyrulepedia API.
    private let repo: HyrulepediaRepository

    /// Initializes the use case with a repository.
    /// - Parameter repository: Repository responsible for fetching Hyrulepedia data.
    init(repository: HyrulepediaRepository) {
        self.repo = repository
    }

    /// Fetches all items using the repository.
    /// - Parameter gameId: The identifier of the game.
    /// - Returns: An array of `HyrulepediaDataEntity`.
    /// - Throws: Throws an error if fetching fails.
    func getItems(gameId: String) async throws -> [HyrulepediaDataEntity] {
        try await repo.getAllItems(gameId: gameId)
    }
}
