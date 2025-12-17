import Foundation

/// Contract defining the operations available for fetching Hyrulepedia data.
protocol HyrulepediaRepositoryContract: Sendable {
    /// Fetches all items for a given game.
    /// - Parameter gameId: The identifier of the game.
    /// - Returns: An array of `HyrulepediaDataEntity` representing all items in the game.
    /// - Throws: Throws an error if the request fails or data cannot be decoded.
    func getAllItems(gameId: String) async throws -> [HyrulepediaDataEntity]

    /// Fetches a single item by its ID for a given game.
    /// - Parameters:
    ///   - itemId: The identifier of the item.
    ///   - gameId: The identifier of the game.
    /// - Returns: A `HyrulepediaDataEntity` representing the requested item.
    /// - Throws: Throws an error if the request fails or data cannot be decoded.
    func getItem(itemId: Int, gameId: String) async throws -> HyrulepediaDataEntity
}
