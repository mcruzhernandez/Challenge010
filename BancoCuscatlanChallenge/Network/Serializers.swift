//
//  Serializers.swift
//  BancoCuscatlanChallenge
//
//  Created by Alejandro Cruz on 8/3/23.
//

import Foundation
import Alamofire

class ErrorResponseSerializer: ResponseSerializer {
    func serialize(
        request: URLRequest?,
        response: HTTPURLResponse?,
        data: Data?,
        error: Error?
    ) throws -> ResponseError {
        
        guard data != nil else {
            return .connection
        }
        
        return .server(message: error?.localizedDescription ?? "Unidentified Error")
    }
}
