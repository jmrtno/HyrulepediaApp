import Foundation

/// Protocol defining a network service capable of executing requests and decoding responses.
protocol NetworkService: Sendable {
    
    /// Executes an HTTP request for the given endpoint and decodes the response into a specified type.
    /// - Parameter endpoint: The endpoint containing URL, HTTP method, headers, and body.
    /// - Returns: A decoded object of type `T` conforming to `Decodable`.
    /// - Throws: An error if the request fails, the response is invalid, or decoding fails.
    func execute<T: Decodable>(_ endpoint: Endpoint) async throws -> T
}
