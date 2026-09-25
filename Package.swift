// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "Adverge",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "Adverge",
            type: .static,
            targets: ["Adverge"]
        ),
    ],
    dependencies: [
        // AdvergeAdsSdk.xcframework is built against Google Mobile Ads SDK
        // 13.2.0. Declaring it here makes the GoogleMobileAds module available
        // to consumers of the Adverge library.
        .package(
            url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
            .upToNextMajor(from: "13.2.0")
        ),
    ],
    targets: [
        .binaryTarget(
            name: "AdvergeAdsSdk",
            path: "Frameworks/AdvergeAdsSdk.xcframework"
        ),
        .target(
            name: "Adverge",
            dependencies: [
                "AdvergeAdsSdk",
                .product(
                    name: "GoogleMobileAds",
                    package: "swift-package-manager-google-mobile-ads"
                )
            ],
            path: "Sources/Adverge",
            linkerSettings: [
                .linkedFramework("AdSupport"),
                .linkedFramework("AppTrackingTransparency"),
                .linkedFramework("WebKit")
            ]
        ),
    ]
)
