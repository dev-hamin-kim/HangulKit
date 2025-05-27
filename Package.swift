// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "HangulKit",
    platforms: [
        .iOS(.v13), .macOS(.v11)
    ],
    products: [
        .library(
            name: "HangulKit",
            targets: ["HangulKit"]),
    ],
    targets: [
        .target(
            name: "HangulKit"
        ),
        .testTarget(
            name: "HangulKitTests",
            dependencies: ["HangulKit"]
        ),
    ]
)
