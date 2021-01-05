//
//  Extension_UIDevice.swift
//  CMBaseSDK
//
//  Created by Coolmint on 2021/01/04.
//
#if os(iOS)
import UIKit

public extension UIDevice {
  struct SafeAreaInset {
    let top: CGFloat
    let bottom: CGFloat
  }
  
  static var safeAreaInset: SafeAreaInset {
    guard let root = UIApplication.shared.windows.filter({$0.isKeyWindow}).first?.rootViewController else {
      return SafeAreaInset(top: 0, bottom: 0)
    }
    
    let topSafeArea = root.view.safeAreaInsets.top
    let bottomSafeArea = root.view.safeAreaInsets.bottom
    
    return SafeAreaInset(top: topSafeArea, bottom: bottomSafeArea)
  }
  
  static var topSafeAreaInset: CGFloat {
    return safeAreaInset.top
  }
  
  static var bottomSafeAreaInset: CGFloat {
    return safeAreaInset.bottom
  }
  
  static var hasTopSafeArea: Bool {
    return topSafeAreaInset == 20 || topSafeAreaInset == 0 ? false : true
  }
  
  static var hasbottomSafeArea: Bool {
    return bottomSafeAreaInset == 0 ? false : true
  }
}
#endif
