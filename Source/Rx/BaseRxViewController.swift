//
//  BaseRxViewController.swift
//  CMBaseSDK
//
//  Created by Coolmint on 2021/01/02.
//

import UIKit
import RxSwift

open class BaseRxViewController: BaseViewController {
  var disposeBag = DisposeBag()
  
  open override func viewDidLoad() {
    super.viewDidLoad()
  }
}
