//
//  BaseButton.swift
//  CMBaseSDK
//
//  Created by Coolmint on 2021/01/03.
//
#if os(iOS)
import UIKit

open class BaseButton: UIButton {
  convenience init(size: CGFloat,
                   weight: UIFont.Weight,
                   bgColor: UIColor = .clear,
                   disabledBgColor: UIColor? = nil,
                   cornerRadius: CGFloat = 0,
                   text: String? = nil,
                   textColor: UIColor = .black,
                   borderColor: UIColor? = nil) {
    self.init(frame: .zero)
    titleLabel?.font = .systemFont(ofSize: size, weight: weight)
    setTitle(text, for: .normal)
    setTitleColor(textColor, for: .normal)
    setTitleColor(textColor.withAlphaComponent(0.7), for: .highlighted)
    setBackgroundColor(bgColor, for: .normal)
    layer.cornerRadius = cornerRadius
    clipsToBounds = true
    if bgColor != .clear {
      setBackgroundColor(bgColor.withAlphaComponent(0.8), for: .highlighted)
    }
    if let disabledBgColor = disabledBgColor {
      setBackgroundColor(disabledBgColor, for: .disabled)
    }
    if let borderColor = borderColor {
      layer.borderColor = borderColor.cgColor
      layer.borderWidth = 1
    }
  }
}

public extension BaseButton {
    static func regular(size: CGFloat,
                        bgColor: UIColor = .clear,
                        disabledBgColor: UIColor? = nil,
                        cornerRadius: CGFloat = 0,
                        text: String? = nil,
                        textColor: UIColor = .black,
                        borderColor: UIColor? = nil) -> BaseButton {
      return BaseButton(size: size,
                        weight: .regular,
                        bgColor: bgColor,
                        disabledBgColor: disabledBgColor,
                        cornerRadius: cornerRadius,
                        text: text,
                        textColor: textColor,
                        borderColor: borderColor)
    }
    
    static func bold(size: CGFloat,
                        bgColor: UIColor = .clear,
                        disabledBgColor: UIColor? = nil,
                        cornerRadius: CGFloat = 0,
                        text: String? = nil,
                        textColor: UIColor = .black,
                        borderColor: UIColor? = nil) -> BaseButton {
      return BaseButton(size: size,
                        weight: .bold,
                        bgColor: bgColor,
                        disabledBgColor: disabledBgColor,
                        cornerRadius: cornerRadius,
                        text: text,
                        textColor: textColor,
                        borderColor: borderColor)
    }
    
    static func medium(size: CGFloat,
                        bgColor: UIColor = .clear,
                        disabledBgColor: UIColor? = nil,
                        cornerRadius: CGFloat = 0,
                        text: String? = nil,
                        textColor: UIColor = .black,
                        borderColor: UIColor? = nil) -> BaseButton {
      return BaseButton(size: size,
                        weight: .medium,
                        bgColor: bgColor,
                        disabledBgColor: disabledBgColor,
                        cornerRadius: cornerRadius,
                        text: text,
                        textColor: textColor,
                        borderColor: borderColor)
    }
}
#endif
