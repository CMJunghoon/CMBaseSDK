//
//  Extension_String.swift
//  CMBaseSDK
//
//  Created by Coolmint on 2021/01/04.
//
#if os(iOS)
import Foundation
import UIKit

extension String {
  var normalized: String {
    return replacingOccurrences(of: "[^0-9]",
                                with: "",
                                options: .regularExpression,
                                range: nil)
  }
}

extension Substring {
  var string: String {
    return String(self)
  }
}

#endif
