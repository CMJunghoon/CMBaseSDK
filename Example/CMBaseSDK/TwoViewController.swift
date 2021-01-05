//
//  TwoViewController.swift
//  CMBaseSDK_Example
//
//  Created by Coolmint on 2021/01/04.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import CMBaseSDK

class TwoViewController: BaseViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print(UIDevice.topSafeAreaInset)
    view.backgroundColor = UIColor.blue.withAlphaComponent(0.3)
  }
}
