//
//  ViewTransition.swift
//  CoolMintSDK
//
//  Created 최정훈 on 2020/07/14.
//  Copyright © 2020 CMJunghoon. All rights reserved.
//

import UIKit

public class ViewTransition: NSObject {
  public var viewDirection: ModalDirection
  var viewTransitionController: ModalAnimatedTransition?
  public var transitionDuration: TimeInterval
  
  public init(viewDirection: ModalDirection,
       duration: TimeInterval) {
    self.viewDirection = viewDirection
    self.transitionDuration = duration
    super.init()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension ViewTransition: UIViewControllerTransitioningDelegate {
  public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    viewTransitionController = ModalAnimatedTransition(duration: transitionDuration,
                                                       direction: viewDirection)
    viewTransitionController?.preseting = false
    viewTransitionController?.viewDirection = viewDirection
    return viewTransitionController
  }
  
  public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    viewTransitionController = ModalAnimatedTransition(duration: transitionDuration,
                                                       direction: viewDirection)
    viewTransitionController?.preseting = true
    viewTransitionController?.viewDirection = viewDirection
    return viewTransitionController
  }
}
