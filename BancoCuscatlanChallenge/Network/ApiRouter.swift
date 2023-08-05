//
//  Router.swift
//  BancoCuscatlanChallenge
//
//  Created by Alejandro Cruz on 8/3/23.
//

import Foundation
import Alamofire

enum ApiRouter {
    
    case pokedex(region: String)
    case pokemon(number: String)
    
    // base url
    var baseURL: URL {
        URL(string: "https://pokeapi.co/api/v2/")!
    }
    
    // path url
    var path: String {
        switch self {
        case .pokedex(let region):
            return "pokedex/\(region)"
        case .pokemon(let pokemon):
            return "pokemon/\(pokemon)"
        }
    }
    
    // request type
    var method: HTTPMethod {
        switch self {
        case .pokedex, .pokemon:
            return .get
        }
    }
    
    // endpoint query params
    var parameters: [String: String] {
        switch self {
        case let .pokedex(region: region):
            return ["region": region]
        case let .pokemon(number: number):
            return ["number": number]
        }
    }
    
}

extension ApiRouter: URLRequestConvertible {
  func asURLRequest() throws -> URLRequest {
    
    let url = baseURL.appendingPathComponent(path)
    
    var request = URLRequest(url: url)
    request.method = method
//    request = try URLEncodedFormParameterEncoder(destination: .methodDependent)
//    .encode(parameters, into: request)
    
    return request
  }
}
