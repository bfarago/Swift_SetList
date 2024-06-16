// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Swift_SetList",
    platforms: [
        .iOS(.v17) , .macOS(.v14)
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "Swift_SetList",
            path: "setlist_app/SetList/SetList",
            exclude: [
                "Assets.xcassets", "Preview Content/Preview Assets.xcassets" 
                //, "SetList.xcdatamodeld"
            ]
        ),
        .testTarget(
            name: "Swift_SetList_Tests",
            dependencies: ["Swift_SetList"],
            path: "setlist_app/SetList/SetListUITests"
        ),
    ]
)
