import Foundation

/// Configuration for network requests, including the base URL.
struct NetworkConfig {
    /// The base URL for all API requests.
    let baseURL: URL

    /// Default initializer sets the base URL.
    init() {
        self.baseURL = URL(string: "https://botw-compendium.herokuapp.com/api/v3")!
    }
}
