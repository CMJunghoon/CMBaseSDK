//
//  BaseViewModel.swift
//  CMBaseSDK
//
//  Created by Coolmint on 2021/01/02.
//
#if os(iOS)
import UIKit

public protocol ViewModelDI: UIViewController {
  associatedtype ViewModelType: BaseViewModel
  var viewModel: ViewModelType! { get set }
  
  init(viewModel: ViewModelType)
}

public extension ViewModelDI {
  init(viewModel: ViewModelType) {
    self.init()
    self.viewModel = viewModel
  }
}

public protocol BaseViewModel {}
#endif
