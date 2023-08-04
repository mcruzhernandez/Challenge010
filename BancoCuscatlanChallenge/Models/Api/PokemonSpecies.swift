//
//  PokemonSpecies.swift
//  BancoCuscatlanChallenge
//
//  Created by Alejandro Cruz on 8/4/23.
//

import Foundation

struct PokemonSpecies: Codable {
    var id: Int = 0
    var name: String = ""
    var color: Color = Color()
    var flavor_text_entries: [PokemonTextEntry] = [PokemonTextEntry]()
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

struct Color: Codable {
    var name: String = ""
}
