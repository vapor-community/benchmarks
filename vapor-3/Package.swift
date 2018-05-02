// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "Benchmark",
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", .branch("gm")),
    ],
    targets: [
        .target(name: "Benchmark", dependencies: ["Vapor"]),
    ]
)
