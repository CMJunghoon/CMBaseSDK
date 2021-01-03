//
//  BaseRxViewModel.swift
//  CMBaseSDK
//
//  Created by Coolmint on 2021/01/02.
//
#if os(iOS)
import UIKit
import RxSwift

public protocol ViewModelRxDI: UIViewController {
  associatedtype ViewModelType: BaseRxViewModel
  var viewModel: ViewModelType! { get set }
  
  init(viewModel: ViewModelType)
  func configureUI()
  func configureStream()
}

public extension ViewModelRxDI {
  init(viewModel: ViewModelType) {
    self.init()
    self.viewModel = viewModel
  }
}

public protocol BaseRxViewModel {
  associatedtype Input
  associatedtype Output

  func bind(input: Input) -> Output
}

private var disposeBagContext: UInt8 = 0

extension BaseViewModel {
  var disposeBag: DisposeBag {
    if let disposeBag = objc_getAssociatedObject(self, &disposeBagContext) as? DisposeBag {
      return disposeBag
    } else {
      let disposeBag = DisposeBag()
      objc_setAssociatedObject(self, &disposeBagContext, disposeBag, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
      return disposeBag
    }
  }
}
#endif
