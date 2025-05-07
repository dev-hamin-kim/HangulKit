//
//  Package.swift
//  HangulKit
//
//  Created by 김하민 on 5/7/25.
//

// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "HangulKit",
    plaforms: [
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
