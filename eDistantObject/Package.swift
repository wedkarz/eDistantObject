// swift-tools-version: 5.6

import PackageDescription

let package = Package(
  name: "eDistantObject",
  products: [
    .library(
      name: "EGDeviceLib",
      targets: ["EGDeviceLib"]),
    .library(
      name: "EGChannelLib",
      targets: ["EGChannelLib"]),
    .library(
      name: "eDistantObject",
      targets: ["eDistantObject"]),
  ],
  dependencies: [],
  targets: [
    .target(
      name: "EGDeviceLib",
      path: "Device/Sources",
      publicHeadersPath: "."
    ),
    .target(
      name: "EGChannelLib",
      dependencies: [
        .target(name: "EGDeviceLib")
      ],
      path: "Channel/Sources",
      publicHeadersPath: "."
    ),
    .target(
      name: "EGMeasureLib",
      path: "Measure/Sources",
      publicHeadersPath: "."
    ),
    .target(
      name: "eDistantObject",
      dependencies: [
        .target(name: "EGChannelLib"),
        .target(name: "EGMeasureLib")
      ],
      path: "Sources"
    )
  ]
)
