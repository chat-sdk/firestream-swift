// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FireStream",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "FireStream",
            targets: ["FireStream"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
         .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "5.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "FireStream",
            dependencies: ["Protocols"]),
        .target(
            name: "Protocols",
            dependencies: ["Message", "Chat", "RxSwift"]),
        .target(
            name: "Message",
            dependencies: ["Types", "Service", "RxSwift"]),
        .target(
            name: "Chat",
            dependencies: ["Events", "RX", "RxSwift"]),
        .target(
            name: "Events",
            dependencies: ["Message", "RxSwift"]),
        .target(
            name: "Types",
            dependencies: ["Service"]),
        .target(
            name: "Service",
            dependencies: []),
        .target(
            name: "RX",
            dependencies: ["RxSwift"]),
        .testTarget(
            name: "FireStreamTests",
            dependencies: ["FireStream"]),
    ]
)
