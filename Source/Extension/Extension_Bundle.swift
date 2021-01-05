//
//  Extension_Bundle.swift
//  CMBaseSDK
//
//  Created by Coolmint on 2021/01/05.
//
#if os(iOS)
import Foundation

extension Bundle {
  var releaseVersionNumber: String {
    return object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
  }
  
  func checkVersion(server: [Int]) -> Bool {
    let appVersion = Bundle.main.releaseVersionNumber.components(separatedBy: ".").compactMap{ Int($0) }
    var isUpdated = false
    for (index, server) in server.enumerated() {
      if server == appVersion[index] {
        isUpdated = false;
        continue
      } else if (server < appVersion[index]) {
        isUpdated = false
        break
      } else {
        isUpdated = true
        break
      }
    }
    return isUpdated
  }
}
#endif
