//
//  File.swift
//  
//
//  Created by Cristian Ayala Laura on 11/12/21.
//

import Foundation

public struct ErrorManager: Error {
    
    let code: Int
    
    public init(code: Int){
        self.code = code
    }
    
    public init(error: Error) {
        self.code = 9999
    }
}
