//
//  HyrulepediaRepository.swift
//  Hyrulepedia
//
//  Created by Javier Martín on 28/11/25.
//
import Foundation

protocol HyrulepediaRepositoryContract: Sendable {
    func getAllItems(gameId: String) async throws -> [HyrulepediaDataEntity]
    func getItem(itemId: Int, gameId: String) async throws -> HyrulepediaDataEntity
}
