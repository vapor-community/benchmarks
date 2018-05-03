// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "Benchmark",
    dependencies: [
        .package(url: "https://github.com/vapor/http.git", from: "3.0.0"),
    ],
    targets: [
        .target(name: "main", dependencies: ["HTTP"], path: "."),
    ]
)
