// swift-tools-version:5.3.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GeoHelper",
    platforms: [.iOS(.v14), .macOS(.v10_15)],
    products: [
        .library(name: "Graphene", targets: ["GeoHelper"])
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire", .upToNextMajor(from: "5.0.0")),
        .package(url: "https://github.com/apple/swift-docc-plugin.git", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "GeoHelper",
            dependencies: ["Alamofire"],
            path: "Sources"
        ),
        .testTarget(
            name: "GeoHelperTests",
            dependencies: ["GeoHelper"],
            path: "Tests"
        )
    ]
)
