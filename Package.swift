// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ALMExtensions",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6),
        .macOS(.v10_15)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ALMFoundationExtensions",
            targets: ["ALMFoundationExtensions"]
        ),
        .library(
            name: "ALMUIKitExtensions",
            targets: ["ALMUIKitExtensions"]
        ),
    ],
    targets: [
        // Targets are the basic blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ALMFoundationExtensions"
        ),
        .target(
            name: "ALMUIKitExtensions",
            dependencies: ["ALMFoundationExtensions"]
        ),
        .testTarget(
            name: "ALMFoundationExtensionsTests",
            dependencies: ["ALMFoundationExtensions", "ALMUIKitExtensions"]
        ),
    ]
)
