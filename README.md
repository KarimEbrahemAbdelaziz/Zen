<h1 align="center"><b>Zen, Zero Effort Networking</b></h1>

<p align="center">
  <img src="https://github.com/KarimEbrahemAbdelaziz/Zen/workflows/Build/badge.svg" />
  <img src="https://img.shields.io/badge/Swift-5.1+-orange.svg" />
  <a href="https://github.com/KarimEbrahemAbdelaziz/Zen/blob/master/LICENSE">
      <img src="http://img.shields.io/badge/license-MIT-70a1fb.svg?style=flat" alt="MIT License" />
  </a>
</p>

<p align="center">
    <a href="https://cocoadocs.org/pods/Zen/">
        <img src="http://img.shields.io/badge/Cocoapods-available-green.svg?style=flat" alt="Cocoapod" />
    </a>
    <a href="https://github.com/KarimEbrahemAbdelaziz/Zen">
        <img src="http://img.shields.io/badge/Carthage-available-green.svg?style=flat" alt="Carthage" />
    </a>
    <a href="https://github.com/KarimEbrahemAbdelaziz/Zen">
        <img src="http://img.shields.io/badge/Swift Package Manager-available-green.svg?style=flat" alt="Swift Package Manager" />
    </a>
    <img src="http://img.shields.io/badge/version-0.1.4-green.svg?style=flat" alt="Version" />
    <br>
    <a href="https://www.facebook.com/KarimEbrahemAbdelaziz">
        <img src="http://img.shields.io/badge/facebook-%40KarimEbrahemAbdelaziz-70a1fb.svg?style=flat" alt="Facebook: @KarimEbrahemAbdelaziz" />
    </a>
    <a href="https://twitter.com/@k_ebrahem_">
        <img src="https://img.shields.io/badge/twitter-@k_ebrahem_-blue.svg?style=flat" alt="Twitter: @k_ebrahem_" />
    </a>
</p>

#

Zen is simple yet powerfull Networking library for iOS. It leverage the powerfull feature of Alamofire and Swift to make building Network Layer more straight forward and efficient.

- [Requirements](#requirements)
- [Installation](#installation)
    - [Cocoapods](#cocoapods)
    - [Carthage](#carthage)
    - [Swift Package Manager](#spm)
- [Usage](#usage)
- [Todo](#todo)
- [Author](#author)
- [License](#license)


## Requirements

* Xcode 11.3+
* Swift 5.1+
* iOS 13+

## Installation

### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate Zen into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'Zen', '~> 0.1.4'
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks. To integrate Zen into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "KarimEbrahemAbdelaziz/Zen" ~> 0.1.4
```

### SPM

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. It is in early development, but Zen does support its use on supported platforms.

Once you have your Swift package set up, adding Zen as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/KarimEbrahemAbdelaziz/Zen.git", .upToNextMajor(from: "0.1.4"))
]
```

## Usage

#### Create your Model (Must Conform to Codable)
```swift
struct Todo: Codable {
    var userId: Int
    var id: Int
    var title: String
    var completed: Bool
}
```

#### Create your API Client 🔥
```swift
import Zen

class APIClient {
    @GET<[Todo]>(url: "https://jsonplaceholder.typicode.com/todos")
    static var fetchTodos: Service<[Todo]>
}
```

#### Use it 🤓
```swift
APIClient.fetchTodos { result in
    print(result)
}
```

## Todo

- [ ] Support all HTTP Methods Requests.
- [ ] Support Body Parameters.
- [ ] Support Query Parameters.
- [ ] Support Headers.
- [ ] Support Interceptors.

## Author

Karim Ebrahem, karimabdelazizmansour@gmail.com
You can find me on Twitter [@k_ebrahem_](https://twitter.com/k_ebrahem_).

## License

Zen is available under the MIT license. See the `LICENSE` file for more info.

Zen will be updated when necessary and fixes will be done as soon as discovered to keep it up to date.

Enjoy!
