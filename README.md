# GeoHelper - Apple SDK

Implementation of the library for the [GeoHelper service](http://geohelper.info) for Apple platforms (iOS / MacOS) 

## Requirements

- iOS 14.0+ / MacOS 10.15+
- Xcode 14.0+
- Swift 5.0+

## Features

- [x] Flexible configuration
- [x] Full coverage of integration tests
- [x] Support Async / Await syntax
- [x] Detailed [documentation]() (only Russian localization)

## Getting Started

The best way to start using GeoHelper is with the Getting Started guide.

[GeoHelper Docs]() describe how to integrate the framework and contains reference documentation about all components.

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate GeoHelper into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '13.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'GeoHelper', '~> 2.0'
end
```

Then, run the following command:

```bash
$ pod install
```

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler.

Once you have your Swift package set up, adding GeoHelper as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/simla-tech/GeoHelperAppleSDK", .upToNextMajor(from: "1.0.0"))
]
```

### Carthage

Carthage isn't supported.

### Manually

If you prefer not to use either of the dependency managers mentioned above, you can manually integrate GeoHelper into your project.
