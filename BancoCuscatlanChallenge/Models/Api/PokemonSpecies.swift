//
//  PokemonSpecies.swift
//  BancoCuscatlanChallenge
//
//  Created by Alejandro Cruz on 8/4/23.
//

import Foundation

struct PokemonSpecies: Codable {
    var color: SpeciesColor = SpeciesColor()
    var flavor_text_entries: [PokemonTextEntry] = [PokemonTextEntry]()
}

struct SpeciesColor: Codable {
    var name: String = ""
}

struct PokemonTextEntry: Codable {
    var flavor_text: String = ""
    var language: EntryLanguage = EntryLanguage()
    var version: EntryVersion = EntryVersion()
}

struct EntryLanguage: Codable {
    var name: String = ""
}

struct EntryVersion: Codable {
    var name: String = ""
}
