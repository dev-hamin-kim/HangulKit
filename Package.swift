//
//  Package.swift
//  HangulKit
//
//  Created by 김하민 on 5/7/25.
//

// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "HangulKit",
    plaforms: [],
    products: [
        .library(
            name: "HangulKit",
            targets: ["HangulKit"]),
    ],
    targets: [
        .target(
            name: "HangulKit"
        )
    ]
)
