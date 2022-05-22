//
//  File.swift
//  
//
//  Created by cristian ayala on 21/05/22.
//

import Foundation

precedencegroup ForwardComposition {
    associativity: left
}

infix operator >>>: ForwardComposition

public func >>> <A,B,C> (f: @escaping (A) -> B, g: @escaping (B) -> C) -> ((A)->C) {
    return { a in
        return g(f(a))
    }
}
