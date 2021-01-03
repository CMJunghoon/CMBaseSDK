//
//  BaseRxViewNavigator.swift
//  CMBaseSDK
//
//  Created by Coolmint on 2021/01/02.
//

import UIKit
import RxSwift
import RxCocoa

protocol BaseNavigator {
  associatedtype ViewController: UIViewController
  
  var viewController: ViewController? { get set }
  
  init(viewController: ViewController)
}

private var disposeBagContext: UInt8 = 0

extension BaseNavigator {
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

extension BaseNavigator {
  func popToViewController() {
    viewController?.navigationController?.popViewController(animated: true)
  }
  
  func observablePopToViewController() -> Observable<Void> {
    return Observable<Void>.create { [viewController] observable -> Disposable in
      viewController?.navigationController?.popViewController(animated: true, completion: {
        observable.onNext(())
        observable.onCompleted()
      })
      return Disposables.create()
    }
  }
  
  func dismiss(animated: Bool = true, completion: (() -> Void)? = nil) {
    viewController?.dismiss(animated: animated, completion: completion)
  }
  
  func dismissRx(animated: Bool = true) -> Observable<Void> {
    return Observable<Void>.create { [viewController] observable -> Disposable in
      viewController?.dismiss(animated: animated, completion: {
        observable.onNext(())
        observable.onCompleted()
      })
      return Disposables.create()
    }
  }
  
  func observableDismiss<T>(animated: Bool = true, completion: T) -> Observable<T> {
    return Observable<T>.create { [viewController] observable -> Disposable in
      viewController?.dismiss(animated: animated, completion: {
        observable.onNext((completion))
        observable.onCompleted()
      })
      return Disposables.create()
    }
  }
  
  func alertMessage(_ message: String) {
    let alertController = UIAlertController(title: message, message: nil, preferredStyle: .alert)
    let action = UIAlertAction(title: "확인", style: .default, handler: nil)
    alertController.addAction(action)
    viewController?.present(alertController, animated: true, completion: nil)
  }
  
  func alertMessageConfirm(_ message: String) -> Observable<Void> {
    return Observable<Void>.create { observable -> Disposable in
      let alertController = UIAlertController(title: message, message: nil, preferredStyle: .alert)
      let action = UIAlertAction(title: "확인", style: .default) { action in
        observable.onNext(())
        observable.onCompleted()
      }
      alertController.addAction(action)
      self.viewController?.present(alertController, animated: true, completion: nil)
      
      return Disposables.create {
        alertController.dismiss(animated: true, completion: nil)
      }
    }
  }
}
