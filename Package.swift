// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "CMBaseSDK",
  platforms: [ .iOS(.v11), .macOS(.v10_12) ],
  products: [
    .library(
      name: "CMBaseSDK",
      targets: ["CMBaseSDK"]),
  ],
  dependencies: [
    // Dependencies declare other packages that this package depends on.
    .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "6.0.0")),
    .package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.0.1")),
    .package(url: "https://github.com/bizz84/SwiftyStoreKit.git", .upToNextMajor(from: "0.16.1")),
    .package(url: "https://github.com/malcommac/SwiftDate.git", .upToNextMajor(from: "5.0.0")),
    .package(url: "https://github.com/marmelroy/Zip.git", .upToNextMinor(from: "2.1.0")),
    .package(url: "https://github.com/bannzai/Gedatsu.git", .upToNextMinor(from: "1.2.0")),
    .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.2.0")),
    .package(url: "https://github.com/JohnSundell/Codextended", .upToNextMajor(from: "0.1.0")),
    .package(url: "https://github.com/onevcat/Kingfisher.git", .upToNextMajor(from: "6.0.0")),
  ],
  targets: [

    .target(
      name: "CMBaseSDK",
      dependencies: [
        "RxSwift", .product(name: "RxCocoa", package: "RxSwift"),
        "SnapKit",
        "SwiftyStoreKit",
        "SwiftDate",
        "Zip",
        "Gedatsu",
        "Alamofire",
        "Codextended",
        "Kingfisher"
      ],
      path:"Source"),
    .testTarget(
      name: "CMBaseSDKTests",
      dependencies: ["CMBaseSDK"]),
  ]
)
