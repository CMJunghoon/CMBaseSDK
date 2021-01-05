//
//  Extension_UIView.swift
//  CMBaseSDK
//
//  Created by Coolmint on 2021/01/04.
//
#if os(iOS)
import UIKit

extension UIView {
  func animateShake(duration: TimeInterval = 0.07, springBothWidth: CGFloat = 20) {
    let animation = CABasicAnimation(keyPath: "position")
    animation.duration = duration
    animation.repeatCount = 3
    animation.autoreverses = true
    animation.fromValue = NSValue(cgPoint: CGPoint(x: center.x - springBothWidth, y: center.y))
    animation.toValue = NSValue(cgPoint: CGPoint(x: center.x + springBothWidth, y: center.y))
    layer.add(animation, forKey: "position")
  }
}
#endif
