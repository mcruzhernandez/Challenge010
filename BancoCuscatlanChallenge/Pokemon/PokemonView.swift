//
//  PokemonView.swift
//  BancoCuscatlanChallenge
//
//  Created by Alejandro Cruz on 8/5/23.
//

import SwiftUI
import Alamofire

struct PokemonView: View {
    
    @State var pokemon: Pokemon = Pokemon()
    @State var pokemonSpecies: PokemonSpecies = PokemonSpecies()
    
    @State var loaded: Bool = true
    
    var body: some View {
        ScrollView {
            PokemonRow(pokemon: pokemon, pokemonSpecies: pokemonSpecies)
            if loaded {
                PokemonStatsRow(pokemon: pokemon, pokemonSpecies: pokemonSpecies)
            }
        }
        .onAppear(perform: loadPokemonSpecies)
        .background(Color.Gray1)
    }
    
    func loadPokemonSpecies() {
        AF.request(ApiRouter.pokemonSpecies(number: "\(pokemon.id)"))
            .validate()
            .responseDecodable(of: PokemonSpecies.self) { response in
                switch response.result {
                case .success(let pokemonSpecies):
                    self.loaded.toggle()
                    self.pokemonSpecies = pokemonSpecies
                default:
                    self.loaded.toggle()
                    break
                }
                
            }
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(
            pokemon: ModelData().dummyPokemon,
            pokemonSpecies: ModelData().dummyPokemonSpecies
        )
    }
}
