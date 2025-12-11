//
//  HyrulepediaRepositoryImpl.swift
//  Hyrulepedia
//
//  Created by Javier Martín on 28/11/25.
//
import Foundation

final class HyrulepediaRepository: HyrulepediaRepositoryContract, @unchecked Sendable {
    private let network: NetworkService

    init(network: NetworkService) {
        self.network = network
    }

    func getAllItems(gameId: String) async throws -> [HyrulepediaDataEntity] {
        let endpoint = Endpoint(
            path: "compendium/all",
            method: .GET,
            query: ["game": gameId]
        )

        let response: HyrulepediaAllResponse = try await network.execute(endpoint)
        return response.data
    }

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
