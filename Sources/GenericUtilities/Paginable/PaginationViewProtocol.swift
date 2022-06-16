//
//  File.swift
//  
//
//  Created by Cristian Ayala on 16/06/22.
//

import UIKit
import Combine

public protocol PaginationViewProtocol: AnyObject {
    associatedtype ViewModel: PaginationViewModelProtocol
    var viewModel: ViewModel {get set}
    var cancellables: Set<AnyCancellable> {get set}
    var refresh: UIRefreshControl {get set}
    func setupPaginationCombine()
    func willDisplay(indexPath: IndexPath)
    func reloadData()
}

public extension PaginationViewProtocol {
    func setupPaginationCombine() {
        self.viewModel.elementsSubject.sink {[weak self] _ in
            self?.reloadData()
            self?.refresh.endRefreshing()
        }.store(in: &cancellables)
    }
    func willDisplay(indexPath: IndexPath) {
        if self.viewModel.elements.count.decrement() <= indexPath.row{
            viewModel.loadMoreData()
        }
    }
    
    func initialLoadData() {
        viewModel.requestData.pageNumber = 1
        viewModel.loadData()
    }
}
