import Foundation

/// Represents an HTTP endpoint with path, method, and optional query parameters.
struct Endpoint {
    /// The path to append to the base URL (e.g., "/users")
    let path: String
    /// The HTTP method (GET, POST, etc.)
    let method: HTTPMethod
    /// Optional query parameters for the request
    let query: [String: String]?
}

extension Endpoint {
    /// Creates a `URLRequest` from the endpoint using the provided base URL.
    /// - Parameter baseURL: The base URL for the API (e.g., https://api.example.com)
    /// - Throws: `URLError.badURL` if the URL cannot be constructed
    /// - Returns: A `URLRequest` ready to be executed
    func makeRequest(baseURL: URL) throws -> URLRequest {
        var components = URLComponents(url: baseURL.appendingPathComponent(path),
                                       resolvingAgainstBaseURL: false)
        if let query = query {
            components?.queryItems = query.map { URLQueryItem(name: $0.key, value: $0.value) }
        }
        guard let url = components?.url else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }
}
