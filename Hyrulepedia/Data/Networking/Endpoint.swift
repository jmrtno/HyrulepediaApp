//
//  Endpoint.swift
//  Hyrulepedia
//
//  Created by Javier Martín on 28/11/25.
//
import Foundation

struct Endpoint {
    let path: String
    let method: HTTPMethod
    let query: [String: String]?
}

extension Endpoint {
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
