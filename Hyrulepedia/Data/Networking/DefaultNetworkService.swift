//
//  DefaultNetworkService.swift
//  Hyrulepedia
//
//  Created by Javier Martín on 28/11/25.
//
import Foundation

final class DefaultNetworkService: NetworkService, @unchecked Sendable {
    private let config: NetworkConfig
    private let session: URLSession

    init(config: NetworkConfig = NetworkConfig(),
         session: URLSession = .shared) {
        self.config = config
        self.session = session
    }

    func execute<T: Decodable>(_ endpoint: Endpoint) async throws -> T {
        let request = try endpoint.makeRequest(baseURL: config.baseURL)

        let (data, response) = try await session.data(for: request)

        guard let http = response as? HTTPURLResponse,
              (200...299).contains(http.statusCode) else {
            throw URLError(.badServerResponse)
        }

        return try JSONDecoder().decode(T.self, from: data)
    }
}
