//
//  Ex+UIWindow.swift
//  CMBaseSDK
//
//  Created by Coolmint on 2021/01/03.
//

#if os(iOS)
import Foundation
import UIKit

extension UIWindow {
  static var key: UIWindow? {
    if #available(iOS 13, *) {
      return UIApplication.shared.windows.filter { $0.isKeyWindow }.first
    } else {
      return UIApplication.shared.keyWindow
    }
  }
}

#endif
