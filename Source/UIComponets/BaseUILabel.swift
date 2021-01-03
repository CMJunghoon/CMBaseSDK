//
//  BaseUILabel.swift
//  CMBaseSDK
//
//  Created by Coolmint on 2021/01/03.
//

import UIKit

public class BaseLabel: UILabel {
  private convenience init(textColor: UIColor,
                           size: CGFloat,
                           weight: UIFont.Weight,
                           text: String?,
                           textAlignment: NSTextAlignment) {
    self.init(frame: CGRect.zero)
    self.font = .systemFont(ofSize: size, weight: weight)
    self.numberOfLines = 0
    self.text = text
    self.textAlignment = textAlignment
    self.textColor = textColor
  }
}

public extension BaseLabel {
  static func regular(textColor: UIColor = .black,
                      size: CGFloat = 16,
                      text: String? = nil,
                      textAlignment: NSTextAlignment = .left) -> BaseLabel {
    return BaseLabel(textColor: textColor,
                     size: size,
                     weight: .regular,
                     text: text,
                     textAlignment: textAlignment)
  }
  
  static func semibold(textColor: UIColor = .black,
                       size: CGFloat = 16,
                       text: String? = nil,
                       textAlignment: NSTextAlignment = .left) -> BaseLabel {
    return BaseLabel(textColor: textColor,
                     size: size,
                     weight: .semibold,
                     text: text,
                     textAlignment: textAlignment)
  }
  
  static func medium(textColor: UIColor = .black,
                       size: CGFloat = 16,
                       text: String? = nil,
                       textAlignment: NSTextAlignment = .left) -> BaseLabel {
    return BaseLabel(textColor: textColor,
                     size: size,
                     weight: .medium,
                     text: text,
                     textAlignment: textAlignment)
  }
}
