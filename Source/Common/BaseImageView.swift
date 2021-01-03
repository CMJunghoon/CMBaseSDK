//
//  BaseImageView.swift
//  CMBaseSDK
//
//  Created by Coolmint on 2021/01/03.
//
#if os(iOS)
import Kingfisher
import UIKit
import Foundation

open class BaseImageView: UIImageView {
  public convenience init(imageName: String? = nil, contentMode: UIView.ContentMode) {
    self.init(frame: .zero)
    if let image = imageName {
      self.image = UIImage(named: image)
    }
    self.contentMode = contentMode
  }
  
  public convenience init(url: String?, contentMode: UIView.ContentMode) {
    self.init(frame: .zero)
    if let image = url {
      let path = URL(string: image)
      self.kf.setImage(with: path)
    }
    self.contentMode = contentMode
  }
  
  public var imageName: String? {
    didSet{
      if let name = imageName {
        image = UIImage(named: name)
      } else {
        image = nil
      }
    }
  }
}
#endif
