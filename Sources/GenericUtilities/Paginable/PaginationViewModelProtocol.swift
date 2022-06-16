//
//  File.swift
//  
//
//  Created by Cristian Ayala on 16/06/22.
//

import Foundation
import Combine

public protocol PaginationViewModelProtocol: AnyObject {
    associatedtype PaginatedModel: PaginationProtocol
    associatedtype RequestModel : PaginationRequestProtocol
    var requestData: RequestModel {get set}
    var elements: [PaginatedModel.Element] {get set}
    func setupData(with data: PaginatedModel)
    var elementsSubject: CurrentValueSubject<Void, Never> {get set}
    var isLoading: Bool {get set}
    func loadData()
    
}

public extension PaginationViewModelProtocol {
    func setupData(with data: PaginatedModel) {
        requestData.pageNumber = data.pageNumber
        requestData.pageSize = data.pageSize
        requestData.totalPage = data.pageTotal
        if data.pageNumber == 1 {
            self.elements = data.data
        } else {
            self.elements.append(contentsOf: data.data)
        }
        elementsSubject.send()
    }
    
    func loadMoreData() {
        let pageNumber = (elements.count / requestData.pageSize).increment()
        if pageNumber <= requestData.totalPage{
            requestData.pageNumber = pageNumber
            loadData()
        }
    }
}
