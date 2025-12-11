//
//  UseCases.swift
//  Hyrulepedia
//
//  Created by Javier Martín on 28/11/25.
//
import Foundation

protocol GetAllItemsUseCaseContract: Sendable {
    func getItems(gameId: String) async throws -> [HyrulepediaDataEntity]
}

final class GetAllItemsUseCase: GetAllItemsUseCaseContract, @unchecked Sendable {
    private let repo: HyrulepediaRepository

    init(repository: HyrulepediaRepository) {
        self.repo = repository
    }

    func getItems(gameId: String) async throws -> [HyrulepediaDataEntity] {
        try await repo.getAllItems(gameId: gameId)
    }
}
