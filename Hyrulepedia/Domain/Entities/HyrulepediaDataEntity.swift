//
//  HyrulepediaDataEntity.swift
//  Hyrulepedia
//
//  Created by Javier Martín on 28/11/25.
//

import Foundation


class HyrulepediaDataEntity: Codable, Identifiable {
    public let id: Int
    let name: String
    let category: String
    let image: String
    let description: String
    let commonLocations: [String]?
    let drops: [String]?
    let dlc: Bool
    let properties: PropertiesEntity?
    let edible: Bool?
    let heartsRecovered: Float?
    let cookingEffect: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case category
        case image
        case description
        case commonLocations = "common_locations"
        case drops
        case dlc
        case properties
        case edible
        case heartsRecovered = "hearts_recovered"
        case cookingEffect = "cooking_effect"
    }
    
    public init(id: Int,
                name: String,
                category: String,
                image: String,
                description: String,
                commonLocations: [String]? = [],
                drops: [String]? = [],
                dlc: Bool,
                properties: PropertiesEntity? = nil,
                edible: Bool? = false,
                heartsRecovered: Float? = 0.0,
                cookingEffect: String? = "") {
        self.id = id
        self.name = name
        self.category = category
        self.image = image
        self.description = description
        self.commonLocations = commonLocations
        self.drops = drops
        self.dlc = dlc
        self.properties = properties
        self.heartsRecovered = heartsRecovered
        self.edible = edible
        self.cookingEffect = cookingEffect
    }
    
    init() {
        id = 0
        name = ""
        category = ""
        image = ""
        description = ""
        commonLocations = []
        drops = []
        dlc = false
        properties = nil
        heartsRecovered = 0.0
        edible = false
        cookingEffect = ""
    }
}

class PropertiesEntity: Codable {
    let attack: Int?
    let defense: Int?
    /// TEARS only
    let effect: String?
    let type: String?
    
    public init(attack: Int?, defense: Int?, effect: String?, type: String?) {
        self.attack = attack
        self.defense = defense
        self.effect = effect
        self.type = type
    }
}

