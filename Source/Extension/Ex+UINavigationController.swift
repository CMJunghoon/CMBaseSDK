//
//  Ex+UINavigationController.swift
//  CMBaseSDK
//
//  Created by Coolmint on 2021/01/02.
//

import UIKit
import RxCocoa
import RxSwift

public extension UINavigationController {
  func editingBackItemTitle(_ title: String) {
    let backItem = UIBarButtonItem()
    backItem.title = title
    backItem.tintColor = .white
    navigationBar.topItem?.backBarButtonItem = backItem
  }
}

public extension UINavigationController {
  func pushViewController(
    _ viewController: UIViewController,
    animated: Bool,
    completion: @escaping () -> Void) {
    pushViewController(viewController, animated: animated)
    
    guard animated, let coordinator = transitionCoordinator else {
      DispatchQueue.main.async { completion() }
      return
    }
    
    coordinator.animate(alongsideTransition: nil) { _ in completion() }
  }
  
  func popViewController(animated: Bool, completion: @escaping () -> Void) {
    popViewController(animated: animated)
    
    guard animated, let coordinator = transitionCoordinator else {
      DispatchQueue.main.async { completion() }
      return
    }
    
    coordinator.animate(alongsideTransition: nil) { _ in completion() }
  }
}
