//
//  GetItemUseCase.swift
//  Hyrulepedia
//
//  Created by Javier Martín on 28/11/25.
//
import Foundation

protocol GetItemUseCaseContract: Sendable {
    func getItem(itemId: Int, gameId: String) async throws -> HyrulepediaDataEntity
}

final class GetItemUseCase: GetItemUseCaseContract, @unchecked Sendable {
    private let repo: HyrulepediaRepository

    required init(repository: HyrulepediaRepository) {
        self.repo = repository
    }

    func getItem(itemId: Int, gameId: String) async throws -> HyrulepediaDataEntity {
        try await repo.getItem(itemId: itemId, gameId: gameId)
    }
}

