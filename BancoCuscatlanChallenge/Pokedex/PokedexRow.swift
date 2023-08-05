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
                .foregroundColor(Color.Gray3)
                .font(.system(size: 16, weight: .medium))
            
            LazyImage(url: URL(string: pokemon.sprites.front_default))
                .frame(width: 100.0, height: 100.0)
            Text(pokemon.name)
                .foregroundColor(Color.Blue4)
                .font(.system(size: 18, weight: .semibold))

        }
        .onAppear(perform: loadPokemon)
        .padding(.all)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.white))
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
