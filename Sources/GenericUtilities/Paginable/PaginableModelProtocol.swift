//
//  File.swift
//  
//
//  Created by Cristian Ayala on 16/06/22.
//

import Foundation


public protocol PaginationRequestProtocol {
    var pageNumber: Int {get set}
    var pageSize: Int {get set}
    var totalPage: Int {get set}
}

public protocol PaginationProtocol {
    associatedtype Element
    var pageNumber: Int {get set}
    var pageSize: Int {get set}
    var pageTotal: Int {get set}
    var data: [Element] {get set}
}
