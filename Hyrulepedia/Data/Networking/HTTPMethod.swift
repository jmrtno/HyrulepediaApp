import Foundation

/// Represents the HTTP methods used in network requests.
enum HTTPMethod: String {
    /// Retrieve data from a server.
    case GET
    /// Send new data to the server.
    case POST
    /// Update existing data on the server.
    case PUT
    /// Delete data from the server.
    case DELETE
}
