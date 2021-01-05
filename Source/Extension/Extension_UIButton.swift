//
//  Ex+UIButton.swift
//  CMBaseSDK
//
//  Created by Coolmint on 2021/01/03.
//
#if os(iOS)
import UIKit

public extension UIButton {
  func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
    UIGraphicsBeginImageContext(CGSize(width: 1.0, height: 1.0))
    guard let context = UIGraphicsGetCurrentContext() else { return }
    context.setFillColor(color.cgColor)
    context.fill(CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0))
    
    let backgroundImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
     
    setBackgroundImage(backgroundImage, for: state)
  }
}
#endif
