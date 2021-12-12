//
//  File.swift
//  
//
//  Created by Cristian Ayala Laura on 11/12/21.
//

import Foundation

public enum ResponseAPI<T> {
    case success(T)
    case failure(Error)
}
