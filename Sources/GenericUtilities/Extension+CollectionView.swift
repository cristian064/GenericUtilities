//
//  File.swift
//  
//
//  Created by Cristian Ayala Laura on 18/07/21.
//

import UIKit

extension UICollectionViewCell{
    static var cellIdentifier : String {
        return "\(String(describing: self))Identifier"
    }
}

extension UICollectionReusableView {
    static var headerIdentifier : String{
        return "\(String(describing: self))Identifier"
    }
    static var footerIdentifier : String{
        return "\(String(describing: self))Identifier"
    }
}

