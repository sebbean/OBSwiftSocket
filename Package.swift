// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "OBSwiftSocket",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "OBSwiftSocket",
            targets: ["OBSwiftSocket"]),
    ],
    dependencies: [
        .package(url: "https://github.com/edonv/JSONValue.git",
                 .branch("main")),
        .package(url: "https://github.com/edonv/WSPublisher.git",
                 .exact("0.1.1")),
        .package(url: "https://github.com/hirotakan/MessagePacker.git",
                 .branch("master")),
        .package(url: "https://github.com/edonv/CommonExtensions.git",
                 .branch("main")),
        .package(url: "https://github.com/edonv/AsyncCompatibilityKit.git",
                 .branch("main")),
    ],
    targets: [
        .target(
            name: "OBSwiftSocket",
            dependencies: [
                "JSONValue",
                "WSPublisher",
                "MessagePacker",
                "AsyncCompatibilityKit",
                .product(name: "CombineExtensions", package: "CommonExtensions")
            ],
            resources: [.copy("../PrivacyInfo.xcprivacy")]
        ),
        .executableTarget(
            name: "Scripts",
            dependencies: ["JSONValue"],
            resources: [
                .copy("Resources")
            ]
        ),
        .testTarget(
            name: "OBSwiftSocketTests",
            dependencies: [
                "OBSwiftSocket",
                .product(name: "CombineExtensions", package: "CommonExtensions")
            ]),
    ]
)
