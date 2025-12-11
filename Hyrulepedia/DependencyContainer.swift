//
//  DependencyContainer.swift
//  Hyrulepedia
//
//  Created by Javier Martín on 28/11/25.
//
import Foundation
import SwiftUI

enum DomainDependencies {
    // Network
    static let network: NetworkService = DefaultNetworkService()

    // Repository
    static let zeldaRepository = HyrulepediaRepository(network: network)

    // UseCases
    static let getAllItemsUseCase: GetAllItemsUseCaseContract =
        GetAllItemsUseCase(repository: zeldaRepository)

    static let getItemUseCase: GetItemUseCaseContract =
        GetItemUseCase(repository: zeldaRepository)

}

enum PresentationDependencies {
    // Navigation
    static let navigationCoordinator = NavigationCoordinator()
}
