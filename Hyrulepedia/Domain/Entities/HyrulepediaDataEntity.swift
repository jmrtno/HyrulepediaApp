import Foundation

/// Represents a single item or entity from the Hyrulepedia API.
class HyrulepediaDataEntity: Codable, Identifiable {
    /// Unique identifier of the entity.
    public let id: Int
    /// Name of the entity.
    let name: String
    /// Category of the entity (e.g., weapon, food, armor).
    let category: String
    /// URL string of the entity’s image.
    let image: String
    /// Description or lore of the entity.
    let description: String
    /// Locations where this entity is commonly found.
    let commonLocations: [String]?
    /// Items dropped by this entity (if any).
    let drops: [String]?
    /// Indicates if the entity is part of a DLC.
    let dlc: Bool
    /// Additional properties of the entity (attack, defense, etc.).
    let properties: PropertiesEntity?
    /// Indicates if the entity is edible.
    let edible: Bool?
    /// Amount of hearts recovered when consumed (if applicable).
    let heartsRecovered: Float?
    /// Cooking effect of the entity (if applicable).
    let cookingEffect: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, category, image, description, drops, dlc, properties, edible
        case commonLocations = "common_locations"
        case heartsRecovered = "hearts_recovered"
        case cookingEffect = "cooking_effect"
    }
    
    /// Initializes a new `HyrulepediaDataEntity` with all properties.
    ///
    /// - Parameters:
    ///   - id: Unique identifier of the entity.
    ///   - name: Name of the entity.
    ///   - category: Category of the entity (e.g., weapon, food, armor).
    ///   - image: URL string of the entity’s image.
    ///   - description: Description or lore of the entity.
    ///   - commonLocations: Locations where this entity is commonly found.
    ///   - drops: Items dropped by this entity (if any).
    ///   - dlc: Indicates if the entity is part of a DLC.
    ///   - properties: Additional properties of the entity (attack, defense, etc.).
    ///   - edible: Indicates if the entity is edible.
    ///   - heartsRecovered: Amount of hearts recovered when consumed (if applicable).
    ///   - cookingEffect: Cooking effect of the entity (if applicable).
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
        self.edible = edible
        self.heartsRecovered = heartsRecovered
        self.cookingEffect = cookingEffect
    }
    
    /// Default initializer with empty or zeroed values.
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

/// Represents additional properties of a Hyrulepedia entity.
class PropertiesEntity: Codable {
    /// Attack value (if applicable).
    let attack: Int?
    /// Defense value (if applicable).
    let defense: Int?
    /// Special effect, applicable to certain items (e.g., Tears).
    let effect: String?
    /// Type of the entity or property (e.g., weapon, armor, consumable).
    let type: String?
    
    /// Initializes a new `PropertiesEntity`.
    ///
    /// - Parameters:
    ///   - attack: Attack value (if applicable).
    ///   - defense: Defense value (if applicable).
    ///   - effect: Special effect, applicable to certain items.
    ///   - type: Type of the entity or property.
    public init(attack: Int?, defense: Int?, effect: String?, type: String?) {
        self.attack = attack
        self.defense = defense
        self.effect = effect
        self.type = type
    }
}
