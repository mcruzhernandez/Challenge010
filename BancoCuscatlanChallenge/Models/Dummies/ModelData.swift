//
//  ModelData.swift
//  BancoCuscatlanChallenge
//
//  Created by Alejandro Cruz on 8/4/23.
//

import Foundation

final class ModelData: ObservableObject {
    @Published var dummyPosts: Pokedex = load("DummyPokedex.json")
    @Published var dummyComments: Pokemon = load("DummyPokemon.json")
    @Published var dummyPhotos: PokemonSpecies = load("DummyPokemonSpicies.json")
    
    @Published var posts: Pokedex = Pokedex()
    @Published var photos: Pokemon = Pokemon()
    @Published var comments: PokemonSpecies = PokemonSpecies()
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
