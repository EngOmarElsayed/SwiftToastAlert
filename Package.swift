// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftToastAlert",
    platforms: [
      .iOS(.v16),
    ],
    products: [
        .library(
            name: "SwiftToastAlert",
            targets: ["SwiftToastAlert"]),
    ],
    targets: [
        .target(
            name: "SwiftToastAlert"),
        .testTarget(
            name: "SwiftToastAlertTests",
            dependencies: ["SwiftToastAlert"]),
    ]
)
