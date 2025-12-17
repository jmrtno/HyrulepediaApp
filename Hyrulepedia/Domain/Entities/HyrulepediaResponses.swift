import Foundation

/// Response model for fetching all items from Hyrulepedia API.
class HyrulepediaAllResponse: Decodable {
    /// Array of data entities returned by the API.
    let data: [HyrulepediaDataEntity]
}

/// Response model for fetching a single item from Hyrulepedia API.
class HyrulepediaItemResponse: Decodable {
    /// Single data entity returned by the API.
    let data: HyrulepediaDataEntity
}
