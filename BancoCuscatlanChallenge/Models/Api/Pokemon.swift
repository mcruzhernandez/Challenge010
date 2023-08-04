//
//  Pokemon.swift
//  BancoCuscatlanChallenge
//
//  Created by Alejandro Cruz on 8/3/23.
//

import Foundation

struct Pokemon {
    var name: String
    var image: String
    var description: String

    init() {
        name = ""
        image = ""
        description = ""
    }
}

struct PokedexInformation: Codable {
    var id: Int
    var name: String
    var flavor_text_entries: [PokemonTextEntry]
}

struct PokemonTextEntry: Codable {
    var flavor_text: String
    var language: Language
    var version: Version
}

struct Language: Codable {
    var name: String
}

struct Version: Codable {
    var name: String
}

struct PokemonSpecieInformation: Codable {
    var height: Int
    var weight: Int
    var types: [PokemonType]
    var sprites: PokemonSprite
}

struct PokemonType: Codable {
    var slot: Int
    var type: PokemonTypeInformation
}

struct PokemonTypeInformation: Codable {
    var name: String
}

struct PokemonSprite: Codable {
    var back_default: String
    var front_default: String
}
