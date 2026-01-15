//
//  PokemonView.swift
//  BancoCuscatlanChallenge
//
//  Created by Alejandro Cruz on 8/5/23.
//

import SwiftUI

struct PokemonView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State var pokemon: Pokemon = Pokemon()
    @StateObject var viewModel = PokemonViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                if viewModel.loaded {
                    PokemonRow(pokemon: pokemon, pokemonSpecies: viewModel.pokemonSpecies)
                    PokemonStatsRow(pokemon: pokemon, pokemonSpecies: viewModel.pokemonSpecies)
                }
            }
            .onAppear {
                viewModel.loadPokemonSpecies(pokemonId: "\(pokemon.id)")
            }
            .background(Color.Gray1)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
            NavBackButton(dismiss: self.dismiss, pokemonName: pokemon.name)
        )
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Text("#\(pokemon.id)")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.Gray4)
            }
        }
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = PokemonViewModel()
        vm.pokemonSpecies = ModelData().dummyPokemonSpecies
        
        return PokemonView(
            pokemon: ModelData().dummyPokemon,
            viewModel: vm
        )
    }
}
