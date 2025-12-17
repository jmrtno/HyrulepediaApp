import Foundation

/// Repository responsible for fetching Hyrulepedia data from the network.
final class HyrulepediaRepository: HyrulepediaRepositoryContract, @unchecked Sendable {
    /// The network service used to execute API requests.
    private let network: NetworkService

    /// Initializes the repository with a network service.
    /// - Parameter network: The service responsible for making network calls.
    init(network: NetworkService) {
        self.network = network
    }

    /// Fetches all items for a given game.
    /// - Parameter gameId: Identifier of the game.
    /// - Returns: Array of Hyrulepedia data entities.
    func getAllItems(gameId: String) async throws -> [HyrulepediaDataEntity] {
        let endpoint = Endpoint(
            path: "compendium/all",
            method: .GET,
            query: ["game": gameId]
        )

        let response: HyrulepediaAllResponse = try await network.execute(endpoint)
        return response.data
    }

    /// Fetches a specific item by its ID for a given game.
    /// - Parameters:
    ///   - itemId: Identifier of the item.
    ///   - gameId: Identifier of the game.
    /// - Returns: Hyrulepedia data entity for the item.
    func getItem(itemId: Int, gameId: String) async throws -> HyrulepediaDataEntity {
        let endpoint = Endpoint(
            path: "compendium/entry/\(itemId)",
            method: .GET,
            query: ["game": gameId]
        )

        let response: HyrulepediaItemResponse = try await network.execute(endpoint)
        return response.data
    }
}
