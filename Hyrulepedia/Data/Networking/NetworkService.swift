//
//  NetworkService.swift
//  Hyrulepedia
//
//  Created by Javier Martín on 28/11/25.
//
import Foundation

protocol NetworkService: Sendable {
    func execute<T: Decodable>(_ endpoint: Endpoint) async throws -> T
}
