# MLChat

[![Platforms](https://img.shields.io/cocoapods/p/MLChat.svg)](https://cocoapods.org/pods/MLChat)
[![License](https://img.shields.io/cocoapods/l/MLChat.svg)](https://raw.githubusercontent.com/micheltlutz/MLChat/master/LICENSE)

[![Swift Package Manager](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods compatible](https://img.shields.io/cocoapods/v/MLChat.svg)](https://cocoapods.org/pods/MLChat)

[![Travis](https://img.shields.io/travis/micheltlutz/MLChat/master.svg)](https://travis-ci.org/micheltlutz/MLChat/branches)
[![SwiftFrameworkTemplate](https://img.shields.io/badge/SwiftFramework-Template-red.svg)](http://github.com/RahulKatariya/SwiftFrameworkTemplate)

A simple chat conversation

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)

## Requirements

- iOS 8.0+ / Mac OS X 10.10+ / tvOS 9.0+ / watchOS 2.0+
- Xcode 10.0+

## Installation

### Dependency Managers
<details>
  <summary><strong>CocoaPods</strong></summary>

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate MLChat into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '11.0'
use_frameworks!

pod 'MLChat', '~> 1.0.2'
```

Then, run the following command:

```bash
$ pod install
```

</details>

<details>
  <summary><strong>Carthage</strong></summary>

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that automates the process of adding frameworks to your Cocoa application.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate MLChat into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "micheltlutz/MLChat" ~> 1.0.2
```

</details>

<details>
  <summary><strong>Swift Package Manager</strong></summary>

To use MLChat as a [Swift Package Manager](https://swift.org/package-manager/) package just add the following in your Package.swift file.

``` swift
// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "HelloMLChat",
    dependencies: [
        .package(url: "https://github.com/micheltlutz/MLChat.git", .upToNextMajor(from: "1.0.2"))
    ],
    targets: [
        .target(name: "HelloMLChat", dependencies: ["MLChat"])
    ]
)
```
</details>

### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate MLChat into your project manually.

<details>
  <summary><strong>Git Submodules</strong></summary><p>

- Open up Terminal, `cd` into your top-level project directory, and run the following command "if" your project is not initialized as a git repository:

```bash
$ git init
```

- Add MLChat as a git [submodule](http://git-scm.com/docs/git-submodule) by running the following command:

```bash
$ git submodule add https://github.com/micheltlutz/MLChat.git
$ git submodule update --init --recursive
```

- Open the new `MLChat` folder, and drag the `MLChat.xcodeproj` into the Project Navigator of your application's Xcode project.

    > It should appear nested underneath your application's blue project icon. Whether it is above or below all the other Xcode groups does not matter.

- Select the `MLChat.xcodeproj` in the Project Navigator and verify the deployment target matches that of your application target.
- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- You will see two different `MLChat.xcodeproj` folders each with two different versions of the `MLChat.framework` nested inside a `Products` folder.

    > It does not matter which `Products` folder you choose from.

- Select the `MLChat.framework`.

- And that's it!

> The `MLChat.framework` is automagically added as a target dependency, linked framework and embedded framework in a copy files build phase which is all you need to build on the simulator and a device.

</p></details>

<details>
  <summary><strong>Embedded Binaries</strong></summary><p>

- Download the latest release from https://github.com/micheltlutz/MLChat/releases
- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- Add the downloaded `MLChat.framework`.
- And that's it!

</p></details>


## Usage

### ChatConfigurations

* ChatConfigurations is optional if nil the library uses default configurations.

```swift

public struct ChatConfigurations {
    ///Define color for button action
    public let actionColor: String
    ///Define background color for bubble
    public let bubbleBackgroundColor: String
    ///Define text color for message text
    public let messageColor: String
    ///Define text color for message text is incoming
    public let messageColorIncoming: String
    ///Define text color for message time
    public let timerMessageColor: String
    ///Define background color for bubble when message is incoming
    public let bubbleBagroundColorIncoming: String
    ///Define background color for chat
    public let backgroundColor: String
    ///Define text for send button
    public let actionText: String
    ///Define color for top line in TextView
    public let borderColorInputView: String
    ///Limit for height TextView
    public let maximumNumberOfLines: Int
    ///Custom image for activity indicator, when using this property the component UIRefreshControl shift de default activity indicator
    public let customImageLoading: String?
    ///Define hello message for new chat or chatMessages[]
    public let helloMessage: String?
    ///Define font color for helloMessage
    public let helloMessageColor: String?
    ///Define font for username
    public let nameFont: UIFont?
    ///Define font for Message
    public let messageFont: UIFont?
    ///Define font for Time message
    public let timeFont: UIFont?
    ///Define font for button action
    public let actionFont: UIFont?
    ///Define font for UITextView font
    public let textViewFont: UIFont?
    ///Define font for Hello Message font
    public let helloMessageFont: UIFont?
}
```

### Using

After linked our .framework on project:

```swift

import MLChat

private var chatConfigurations: ChatConfigurations = {
        let chatDefaultConfigurations = ChatConfigurations(actionColor: "FF4B69",
                                                           bubbleBackgroundColor: "D3D3D3",
                                                           messageColor: "000000",
                                                           messageColorIncoming: "FFFFFF",
                                                           timerMessageColor: "B3B3B2",
                                                           bubbleBagroundColorIncoming: "000000",
                                                           backgroundColor: "FFFFFF",
                                                           actionText: "Enviar",
                                                           borderInputView: "9D9D9D",
                                                           maximumNumberOfLines: 6,
                                                           customImageLoading: nil,
                                                           helloMessage: "Hello buddy! Can I help you?",
                                                           helloMessageColor: "FF4B69",
                                                           nameFont: nil,
                                                           messageFont: nil,
                                                           timeFont: nil,
                                                           actionFont: nil,
                                                           textViewFont: nil,
                                                           helloMessageFont: nil)
        return chatDefaultConfigurations
    }()
    
    
    private var chatInputView: ChatInputView!
    private var chat: MLChat!

override func viewDidLoad() {
    super.viewDidLoad()

    chatInputView = ChatInputView(configuration: chatConfigurations)
    chat = ChatPayly(configurarion: chatConfigurations)
    chat.chatMessages = chatMessageMock.chatMessages // mock messages see Demo Project
}
    
```

### Messages

```swift 
//Data Struct

var chatMessages = [ChatMessage]()

```

### Messages model properties

```swift 
	let name: String
	let text: String
	let isIncoming: Bool
	let date: Date 
```


## Contributing

Issues and pull requests are welcome!

## Author

Michel Anderson Lutz Teixeira [@michel_lutz](https://twitter.com/michel_lutz)

## License

MLChat is released under the MIT license. See [LICENSE](https://github.com/micheltlutz/MLChat/blob/master/LICENSE) for details.
