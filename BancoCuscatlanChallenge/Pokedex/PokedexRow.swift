//
//  PokedexRow.swift
//  BancoCuscatlanChallenge
//
//  Created by Alejandro Cruz on 8/4/23.
//

import NukeUI
import SwiftUI
import Alamofire

struct PokedexRow: View {
    
    @State var pokemon: Pokemon
    
    var body: some View {
        VStack {
            Text("#\(pokemon.id)")
                .foregroundColor(
                    Color(
                        red: 170 / 255,
                        green: 170 / 255,
                        blue: 170 / 255
                    )
                )
                .font(.system(size: 16, weight: .medium))
            
            LazyImage(url: URL(string: pokemon.sprites.front_default))
                .frame(width: 100.0, height: 100.0)
            Text(pokemon.name)
                .foregroundColor(
                    Color(
                        red: 1 / 255,
                        green: 66 / 255,
                        blue: 106 / 255)
                )
                .font(.system(size: 36, weight: .semibold))

        }
        .onAppear(perform: loadPokemon)
        .padding(.all)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color(
                red: 120 / 255,
                green: 177 / 255,
                blue: 181 / 255,
                opacity: 0.1 / 1
            )
        )
        .cornerRadius(15)
    }
    
    func loadPokemon() {
        AF.request(ApiRouter.pokemon(number: "\(pokemon.id)"))
            .validate()
            .responseDecodable(of: Pokemon.self) { response in
                switch response.result {
                case let .success(pokemon):
                    self.pokemon = pokemon
                default:
                    break
                }
            }
    }
    
}

struct PokedexRow_Previews: PreviewProvider {
    static var previews: some View {
        PokedexRow(pokemon: ModelData().dummyPokemon)
    }
}
