//
//  PokemonViewModel.swift
//  BancoCuscatlanChallenge
//
//  Created by Noxtiel on 1/15/26.
//

import Foundation
import Alamofire

class PokemonViewModel: ObservableObject {
    
    @Published var pokemonSpecies: PokemonSpecies = PokemonSpecies()
    @Published var loaded: Bool = false
    
    func loadPokemonSpecies(pokemonId: String) {
        AF.request(ApiRouter.pokemonSpecies(number: pokemonId))
            .validate()
            .responseDecodable(of: PokemonSpecies.self) { response in
                switch response.result {
                case .success(let pokemonSpecies):
                    self.loaded.toggle()
                    self.pokemonSpecies = pokemonSpecies
                default:
                    break
                }
            }
    }
    
}
