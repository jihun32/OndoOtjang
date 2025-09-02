// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Log",
    platforms: [
        .iOS(.v26)
    ],
    products: [
        .library(
            name: "Log",
            targets: ["Log"]
        )
    ],
    targets: [
        .target(
            name: "Log"
        ),
        .testTarget(
            name: "LogTests",
            dependencies: ["Log"]
        ),
    ]
)
