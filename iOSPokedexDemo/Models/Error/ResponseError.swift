//
//  ErrorResponse.swift
//  BancoCuscatlanChallenge
//
//  Created by Alejandro Cruz on 8/3/23.
//

import Foundation

enum ResponseError {
    case connection
    case server(message: String)
}

extension ResponseError {
    var localizedDescription: String {
        switch self {
        case .connection:
            return "Check Your Internet Connection"
        case let .server(message: message):
            return message
        }
    }
}
