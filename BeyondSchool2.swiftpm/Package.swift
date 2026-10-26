// swift-tools-version: 6.0

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "BeyondSchool2",
    platforms: [
        .iOS("18.0")
    ],
    products: [
        .iOSApplication(
            name: "Beyond School",
            targets: ["BeyondSchool2App"],
            bundleIdentifier: "org.beyondschool.beyondschool2",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .car),
            accentColor: .presetColor(.blue),
            supportedDeviceFamilies: [
                .phone,
                .pad
            ],
            supportedInterfaceOrientations: [
                .landscapeLeft,
                .landscapeRight
            ]
        )
    ],
    targets: [
        .executableTarget(
            name: "BeyondSchool2App",
            path: "Sources"
        )
    ]
)
