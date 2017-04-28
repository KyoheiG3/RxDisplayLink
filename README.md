[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Version](https://img.shields.io/cocoapods/v/RxDisplayLink.svg?style=flat)](http://cocoadocs.org/docsets/RxDisplayLink)
[![License](https://img.shields.io/cocoapods/l/RxDisplayLink.svg?style=flat)](http://cocoadocs.org/docsets/RxDisplayLink)
[![Platform](https://img.shields.io/cocoapods/p/RxDisplayLink.svg?style=flat)](http://cocoadocs.org/docsets/RxDisplayLink)

# RxDisplayLink

## Usage

It's very simple.

```swift
CADisplayLink.rx.link()
    .subscribe(onNext: { _ in
        // Your freedom
    })
    .disposed(by: disposeBag)
```

Of course, you can set RunLoop, Mode and FPS. 👌

```swift
CADisplayLink.rx.link(to: .current, forMode: .defaultRunLoopMode, fps: 30)
// OR
RxDisplayLink(to: .current, forMode: .defaultRunLoopMode, fps: 30)
```

## How to Install RxDisplayLink

#### CocoaPods

Add the following to your `Podfile`:

```Ruby
pod "RxDisplayLink"
use_frameworks!
```
Note: the `use_frameworks!` is required for pods made in Swift.

#### Carthage

Add the following to your `Cartfile`:

```Ruby
github "KyoheiG3/RxDisplayLink"
```

## LICENSE

Under the MIT license. See LICENSE file for details.
