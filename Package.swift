// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "StarRating",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "StarRating",
            targets: ["StarRating"]
        ),
    ],
    targets: [
        .target(
            name: "StarRating",
            dependencies: []
        ),
        .testTarget(
            name: "StarRatingTests",
            dependencies: ["StarRating"]
        ),
    ]
)
