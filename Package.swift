// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RxDisplayLink",
    platforms: [.iOS(.v9), .tvOS(.v9)],
    products: [
 
        .library(
            name: "RxDisplayLink",
            targets: ["RxDisplayLink"]),
    ],
 
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift", .upToNextMinor(from: "6.5.0"))
    ],
    targets: [
        .target(
            name: "RxDisplayLink",
            dependencies: [.product(name: "RxSwift", package: "RxSwift")],
            path: "RxDisplayLink")
    ]
)
