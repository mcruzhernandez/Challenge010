//
//  GenericError.swift
//  BancoCuscatlanChallenge
//
//  Created by Alejandro Cruz on 8/3/23.
//

import Foundation

class GenericError: Error {
    var localizedError: String {
        self.localizedDescription
    }
}
