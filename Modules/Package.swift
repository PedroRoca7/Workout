// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Modules",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "Modules",
            targets: ["WorkoutPlayer", "Payment"]
        ),
        .library(
            name: "Payment",
            targets: ["Payment"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "WorkoutsCore",
            dependencies: []
        ),
        .testTarget(
            name: "WorkoutsCoreTests",
            dependencies: ["WorkoutsCore"]
        ),
        .target(
            name: "WorkoutPlayer",
            dependencies: ["WorkoutsCore"]
        ),
        .testTarget(
            name: "WorkoutPlayerTests",
            dependencies: ["WorkoutPlayer"]
        ),
        .target(
            name: "Payment",
            dependencies: ["WorkoutsCore"]
        ),
        .testTarget(
            name: "PaymentTests",
            dependencies: ["Payment"]
        ),
    ]
)
