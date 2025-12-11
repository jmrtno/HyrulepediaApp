//
//  Networking.swift
//  Hyrulepedia
//
//  Created by Javier Martín on 28/11/25.
//
import Foundation

struct NetworkConfig {
    let baseURL: URL

    init() {
        self.baseURL = URL(string: "https://botw-compendium.herokuapp.com/api/v3")!
    }
}
