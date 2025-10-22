// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "GoogleAnalytics",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(
            name: "GoogleAnalytics",
            targets: ["GoogleAnalytics"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "GoogleAnalytics",
            path: "./GoogleAnalytics.xcframework"
        ),
    ]
)

