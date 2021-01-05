//
//  ViewController.swift
//  CMBaseSDK
//
//  Created by coolmint.swift@gmail.com on 01/03/2021.
//  Copyright (c) 2021 coolmint.swift@gmail.com. All rights reserved.
//

import UIKit
import CMBaseSDK

class ViewController: BaseRxViewController {

  
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view, typically from a nib.
    }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    let viewController = TwoViewController()
    viewController.modalPresentationStyle = .custom
    let viewTransition = ViewTransition(viewDirection: .left, duration: 0.7)
    viewController.transitioningDelegate = viewTransition
    
    self.present(viewController, animated: true, completion: nil)
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

