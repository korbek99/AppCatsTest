//
//  Pets.swift
//  AppCatsTest
//
//  Created by Jose Preatorian on 03-02-25.
//
import Foundation

// MARK: - WelcomeElement
struct Pets: Codable {
    let breeds: [Breed]
    let id: String
    let url: String
    let width, height: Int
}

// MARK: - Breed
struct Breed: Codable {
    let weight: Weight
    let id, name: String
    let cfaURL: String
    let vetstreetURL: String
    let vcahospitalsURL: String
    let temperament, origin, countryCodes, countryCode: String
    let description, lifeSpan: String
    let indoor, lap, adaptability, affectionLevel: Int
    let childFriendly, catFriendly, dogFriendly, energyLevel: Int
    let grooming, healthIssues, intelligence, sheddingLevel: Int
    let socialNeeds, strangerFriendly, vocalisation, bidability: Int
    let experimental, hairless, natural, rare: Int
    let rex, suppressedTail, shortLegs: Int
    let wikipediaURL: String
    let hypoallergenic: Int
    let referenceImageID: String

    enum CodingKeys: String, CodingKey {
        case weight, id, name
        case cfaURL = "cfa_url"
        case vetstreetURL = "vetstreet_url"
        case vcahospitalsURL = "vcahospitals_url"
        case temperament, origin
        case countryCodes = "country_codes"
        case countryCode = "country_code"
        case description
        case lifeSpan = "life_span"
        case indoor, lap, adaptability
        case affectionLevel = "affection_level"
        case childFriendly = "child_friendly"
        case catFriendly = "cat_friendly"
        case dogFriendly = "dog_friendly"
        case energyLevel = "energy_level"
        case grooming
        case healthIssues = "health_issues"
        case intelligence
        case sheddingLevel = "shedding_level"
        case socialNeeds = "social_needs"
        case strangerFriendly = "stranger_friendly"
        case vocalisation, bidability, experimental, hairless, natural, rare, rex
        case suppressedTail = "suppressed_tail"
        case shortLegs = "short_legs"
        case wikipediaURL = "wikipedia_url"
        case hypoallergenic
        case referenceImageID = "reference_image_id"
    }
}

// MARK: - Weight
struct Weight: Codable {
    let imperial, metric: String
}

typealias Welcome = [Pets]
