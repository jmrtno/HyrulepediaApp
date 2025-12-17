import Foundation

/// Default network service that executes HTTP requests and decodes JSON responses.
final class DefaultNetworkService: NetworkService, @unchecked Sendable {
    /// Network configuration (baseURL, headers, etc.)
    private let config: NetworkConfig
    /// URLSession used to perform requests
    private let session: URLSession

    /// Initializer
    /// - Parameters:
    ///   - config: Network configuration (default is `NetworkConfig()`)
    ///   - session: URLSession instance (default is `.shared`)
    init(config: NetworkConfig = NetworkConfig(),
         session: URLSession = .shared) {
        self.config = config
        self.session = session
    }

    /// Executes an endpoint and returns a decoded object of the expected type
    /// - Parameter endpoint: Endpoint containing the request information
    /// - Returns: Decoded object of type `T`
    /// - Throws: Throws an error if the request fails, the response is invalid, or decoding fails
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
