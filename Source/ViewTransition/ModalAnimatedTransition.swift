//
//  ModalAnimatedTransition.swift
//  CoolMintSDK
//
//  Created 최정훈 on 2020/07/14.
//  Copyright © 2020 CMJunghoon. All rights reserved.
//

import Foundation
import UIKit

public enum ModalDirection {
  case top
  case bottom
  case left
  case right
  case original
}

public class ModalAnimatedTransition: NSObject {
  var preseting: Bool?
  var viewDirection: ModalDirection
  var transitionDuration: TimeInterval
  
  public init(duration: TimeInterval, direction: ModalDirection) {
    self.transitionDuration = duration
    self.viewDirection = direction
  }
  
  func direction(_ direction: ModalDirection) -> CGRect {
    guard let screen = UIWindow.key?.bounds else { return .zero }
    
    var startFrame: CGRect
    switch direction {
    case .top:
      startFrame = CGRect(x: 0,
                          y: -screen.size.height,
                          width: screen.size.width,
                          height: screen.size.height
      )
    case .bottom:
      startFrame = CGRect(x: 0,
                          y: screen.size.height,
                          width: screen.size.width,
                          height: screen.size.height
      )
    case .left:
      startFrame = CGRect(x: -screen.size.width,
                          y: 0,
                          width: screen.size.width,
                          height: screen.size.height
      )
    case .right:
      startFrame = CGRect(x: screen.size.width,
                          y: 0,
                          width: screen.size.width,
                          height: screen.size.height
      )
    case .original:
      startFrame = CGRect(x: 0,
                          y: 0,
                          width: screen.size.width,
                          height: screen.size.height
      )
    }
    return startFrame
  }
  
  func executePresentingAnimation(transitionContext: UIViewControllerContextTransitioning) {
    transitionContext.containerView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
    transitionContext.containerView.alpha = 1
    
    guard let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else { return }
    
    transitionContext.containerView.addSubview(toVC.view)
    toVC.view.frame = direction(viewDirection)
    let duration = transitionDuration(using: transitionContext)
    
    UIView.animate(withDuration: duration, animations: { [weak self] in
      transitionContext.containerView.alpha = 1
      toVC.view.frame = self?.direction(.original) ?? CGRect.zero
    }, completion: { _ in
      transitionContext.completeTransition(true)
    })
  }
  
  func executeDismissalAnimation(transitionContext: UIViewControllerContextTransitioning) {
    guard let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) else { return }
    let duration = transitionDuration(using: transitionContext)
    
    UIView.animate(withDuration: duration, animations: { [weak self] in
      transitionContext.containerView.alpha = 0
      fromVC.view.frame = self?.direction(self?.viewDirection ?? .original) ?? CGRect.zero
    }, completion: { _ in
      transitionContext.completeTransition(true)
      fromVC.view.removeFromSuperview()
    })
  }
}

extension ModalAnimatedTransition: UIViewControllerAnimatedTransitioning {
  public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return transitionDuration
  }
  
  public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    if self.preseting == true {
      executePresentingAnimation(transitionContext: transitionContext)
    } else {
      executeDismissalAnimation(transitionContext: transitionContext)
    }
  }
}
