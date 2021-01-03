//
//  Ex+TableView.swift
//  CMBaseSDK
//
//  Created by Coolmint on 2021/01/03.
//

import Foundation
import UIKit

protocol ReusableView: class {
  static var reuseIdentifier: String { get }
}

extension ReusableView {
  static var reuseIdentifier: String {
    return String(describing: self)
  }
}

extension UITableView {
  final func register<T: UITableViewCell>(cellType: T.Type) where T: ReusableView {
    self.register(cellType.self, forCellReuseIdentifier: cellType.reuseIdentifier)
  }
  
  final func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath, cellType: T.Type = T.self) -> T where T: ReusableView{
       guard let cell = self.dequeueReusableCell(withIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
         fatalError(
           "Failed to dequeue a cell with identifier \(cellType.reuseIdentifier) matching type \(cellType.self). "
             + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
             + "and that you registered the cell beforehand"
         )
       }
       return cell
   }
  
  final func register<T: UITableViewHeaderFooterView>(headerFooterViewType: T.Type) where T: ReusableView {
      self.register(headerFooterViewType.self, forHeaderFooterViewReuseIdentifier: headerFooterViewType.reuseIdentifier)
  }
  
  final func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_ viewType: T.Type = T.self) -> T? where T: ReusableView {
      guard let view = self.dequeueReusableHeaderFooterView(withIdentifier: viewType.reuseIdentifier) as? T? else {
        fatalError(
          "Failed to dequeue a header/footer with identifier \(viewType.reuseIdentifier) "
            + "matching type \(viewType.self). "
            + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
            + "and that you registered the header/footer beforehand"
        )
      }
      return view
  }
}
