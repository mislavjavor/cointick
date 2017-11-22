// swift-tools-version:4.0
// Managed by ice

import PackageDescription

let package = Package(
    name: "cointick",
    dependencies: [
        .package(url: "https://github.com/jakeheis/SwiftCLI", from: "4.0.2"),
        .package(url: "https://github.com/onevcat/Rainbow", from: "3.0.0"),
        .package(url: "https://github.com/Alamofire/Alamofire", from: "4.5.1"),
    ],
    targets: [
        .target(name: "cointick", dependencies: ["SwiftCLI", "Rainbow", "Alamofire"]),
    ]
)
