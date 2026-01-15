//
//  PokedexViewModel.swift
//  BancoCuscatlanChallenge
//
//  Created by Noxtiel on 1/15/26.
//

import Foundation
import Alamofire

class PokedexViewModel: ObservableObject {
    
    @Published var pokedex = Pokedex()
    
    func loadPokedex(region: String) {
        AF.request(ApiRouter.pokedex(region: region))
            .validate()
            .responseDecodable(of: Pokedex.self) { response in
                switch response.result {
                case .success(let pokedex):
                    print(pokedex)
                    self.pokedex = pokedex
                default:
                    break
                }
            }
    }
    
}
