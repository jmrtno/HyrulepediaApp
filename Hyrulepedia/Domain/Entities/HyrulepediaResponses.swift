//
//  HyrulepediaResponses.swift
//  Hyrulepedia
//
//  Created by Javier Martín on 28/11/25.
//
import Foundation

class HyrulepediaAllResponse: Decodable {
    let data: [HyrulepediaDataEntity]
}

class HyrulepediaItemResponse: Decodable {
    let data: HyrulepediaDataEntity
}
