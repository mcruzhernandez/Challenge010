//
//  PokemonRow.swift
//  BancoCuscatlanChallenge
//
//  Created by Alejandro Cruz on 8/5/23.
//

import NukeUI
import SwiftUI

struct PokemonRow: View {
    
    @State var pokemon: Pokemon
    @State var pokemonSpecies: PokemonSpecies
    
    var body: some View {
        VStack {
            
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .frame(height: 160)
                    .foregroundColor(
                        Color.findCustomColor(color: pokemonSpecies.color.name)
                            .opacity(0.6)
                    )
                    .padding(.top, 180)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                
                LazyImage(url: URL(string: pokemon.sprites.front_default)) { state in
                    if let image = state.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 265, height: 230)
                    }
                }
                
                HStack {
                    ForEach(pokemon.types) { item in
                        Text(item.type.name)
                            .padding(.leading, 25)
                            .padding(.trailing, 25)
                            .padding(.top, 10)
                            .padding(.bottom, 10)
                            .foregroundColor(
                                Color.findCustomColor(color: item.type.name)
                            )
                            .background(.white)
                            .clipShape(Capsule())
                            .overlay(
                                Capsule()
                                    .stroke(
                                        Color.findCustomColor(color: item.type.name),
                                        lineWidth: 1.5
                                    )
                            )
                    }
                }
                .padding(.top, 270)

            }
                        
            
            
            
            HStack(alignment: .center) {
                
                HStack(alignment: .center) {
                    Spacer()
                    
                    Image("weight")
                        .resizable()
                        .frame(width: 30, height: 30)
                    VStack {
                        Text("\(pokemon.weight)")
                            .bold()
                            .font(.system(size: 20))
                            .foregroundColor(.Blue4)
                        Text("Peso")
                            .font(.system(size: 16))
                            .foregroundColor(.Blue2)
                        
                    }
                    .padding(.leading, 8)
                    
                    Spacer()
                }
                .padding(.top)
                .padding(.leading, 20)
                .padding(.bottom)
                
                Divider()
                    .frame(height: 45)
                
                HStack(alignment: .center) {
                    Spacer()
                    
                    Image("height")
                        .resizable()
                        .frame(width: 30, height: 30)
                    VStack{
                        Text("\(pokemon.height)")
                            .bold()
                            .font(.system(size: 20))
                            .foregroundColor(.Blue4)
                        Text("Altura")
                            .font(.system(size: 16))
                            .foregroundColor(.Blue2)
                    }
                    .padding(.leading, 5)
                    
                    Spacer()
                }
                .padding(.trailing, 20)
            }
            .background(.white)
            .cornerRadius(15)
            .padding()
            
            
            HStack {
                Text(pokemonSpecies.flavor_text_entries.first(where: { entry in
                    entry.language.name == "es"
                })?.flavor_text ?? "Descripción no encontrada" )
                .padding(.leading)
                .padding(.trailing)
                .foregroundColor(.Gray4)
            }
                
        }
        
        
    }
}

struct PokemonRow_Previews: PreviewProvider {
    static var previews: some View {
        PokemonRow(
            pokemon: ModelData().dummyPokemon,
            pokemonSpecies: ModelData().dummyPokemonSpecies
        )
    }
}
