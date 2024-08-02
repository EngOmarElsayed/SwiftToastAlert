# SwiftToastAlert
![GitHub License](https://img.shields.io/github/license/EngOmarElsayed/SwiftToastAlert)
[![SPM compatible](https://img.shields.io/badge/SPM-compatible-4BC51D.svg?style=flat)](#swift-package-manager)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FEngOmarElsayed%2FSwiftToastAlert%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/EngOmarElsayed/SwiftToastAlert)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FEngOmarElsayed%2FSwiftToastAlert%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/EngOmarElsayed/SwiftToastAlert)

## Table of Contents
1. [Introduction](#introduction)
2. [How to use](#section-1)
   - [toastAlert](#sub-topic-1.1)
   - [interactiveToastAlert](#sub-topic-1.2)
   - [AlertIconApperance](#sub-topic-1.3)
   - [AlertTextApperance](#sub-topic-1.4)
   - [AlertPosition](#sub-topic-1.5)
3. [Author](#conclusion)

## Introduction <a name="introduction"></a>
Designed for iOS 16+ and SwiftUI, this package offers a sleek toast alert for your users. 
With a user-friendly API and complete design customization, 
you have full control over the alert's look and feel.

This is a preview of the first api `interactiveToastAlert`:

https://github.com/user-attachments/assets/42442024-33e0-4fab-87c6-6ff453f79ca7

The second api `toastAlert` preview:

https://github.com/user-attachments/assets/0cb3ec3f-aa10-4a5f-b3b2-76773443900a

I am open for suggestions so please if you have any 
new features ideas or bugs create a new issue and let's improve it together 💪🏻.

## How to use <a name="section-1"></a>
To make the api easy as possible I created it using viewModifiers. I created two types of api the first one is the 
`toastAlert` which represent an icon image you choose with a rounded rectangle background and dismiss after 3 seconds,
like this one:

https://github.com/user-attachments/assets/0cb3ec3f-aa10-4a5f-b3b2-76773443900a

The second api which is the `interactiveToastAlert` it also does the same thing as `toastAlert` but if the user 
tapped it, it will expand to display more info about the error or what ever message you want to tell to the user and 
after tapping it again it will shrenk and dismiss, Like this one:

https://github.com/user-attachments/assets/42442024-33e0-4fab-87c6-6ff453f79ca7

### toastAlert <a name="sub-topic-1.1"></a>
To use the `toastAlert` is fairly simple, it takes `isPresented` as flag that tells when to appear and disappear the toast,
`position` which is a type of `AlertPosition` that represents the position of the alert toast, `background`
represent the background view of the toast takes what ever the `foregroundStyle` takes which is a type of `ShapeStyle`,
`alertIconAppearance` which is type of a closure that returns `AlertIconApperance` that represent the icon that will be displayed in the alert and
it's appearance. For example:

```swift
struct SwiftUIView: View {
  @State private var isPresented: Bool = false
  
  var body: some View {
    ZStack {
      Color.white.ignoresSafeArea()
      Button("Hello, World 🌍") {
        isPresented.toggle()
      }.foregroundStyle(.black)
    }
    .toastAlert(
      isPresented: $isPresented,
      position: .top,
      background: .black) {
        AlertIconAppearance(image: Image(systemName: "checkmark"), color: .green, font: .system(size: 16, weight: .bold))
      }
 }
}
```
Output:

https://github.com/user-attachments/assets/0cb3ec3f-aa10-4a5f-b3b2-76773443900a

> [!Warning]  
> Don't change the `isPresented` parameter to false after making it true,
> the api changes the value by it's self and making this change by your self
> may lead to unexpected behaviour.

### interactiveToastAlert <a name="sub-topic-1.2"></a>
This api takes the same parameters as the `toastAlert` but with one more extra parameter which is `alertTextAppearance`,
`alertTextAppearance` is a closure that return `AlertTextAppearance` instance that contains the displaied text and it's
apperance. For example:

```swift
struct SwiftUIView: View {
  @State private var isPresented: Bool = false
  
  var body: some View {
    ZStack {
      Color.white.ignoresSafeArea()
      Button("Hello, World 🌍") {
        isPresented.toggle()
      }.foregroundStyle(.black)
    }
    .interactiveToastAlert(isPresented: $isPresented, position: .topTrailing, background: .black) {
      AlertTextAppearance(text: "Replace `var` with `let`", color: .white, font: .system(size: 16, weight: .bold))
    } alertIconAppearance: {
      AlertIconAppearance(image: Image(systemName: "checkmark"), color: .green, font: .system(size: 16, weight: .bold))
    }
 }
}
```

Output:

https://github.com/user-attachments/assets/42442024-33e0-4fab-87c6-6ff453f79ca7

> [!Note]  
> Don't increase the text that will be displayed in the alert
> more than 2 lines because other wise it will be displayed as
> ...

### AlertIconApperance <a name="sub-topic-1.3"></a>
This type represent the icon that will be displayed in the alert and it's apperance. it contains three properties 
`image: Image` represent the icon that will be displayed in the alert it can be SF symbol or image from the asset catalog, 
`color: Color?` represent the color of the icon in the alert, it is used for customizing SF symbol apperance, 
`font: Font?` is used to customize the size and weight of the icon if it was SF symbol.

```swift
/// This type represent the icon that will be displayed in the alert and it's appearance.
public struct AlertIconAppearance {
  /// This represent the icon that will be displayed in the alert, it can be SF symbol or image from the asset catalog.
  public let image: Image
  /// This is the color of the icon in the alert, it is used for SF symbol only.
  public let color: Color?
  /// The font properties is used to customize the size and weight of the icon if it was SF symbol
  public let font: Font?
  
  /// if you are not using SF symbol, don't init the color or the font property.
  public init(image: Image, color: Color? = nil, font: Font? = nil) {
    self.image = image
    self.color = color
    self.font = font
  }
}
```
### AlertTextApperance <a name="sub-topic-1.4"></a>
This type represent the text that will be displayed in the alert and it's apperance. it containes three properties
`text: String` which represent the displayed text in the alert when tapped, `color: Color` represent the color of
the displayed text, `font: Font` represent properties of the displayed text, which contains size, weight and font type of the ``text``.

```swift
/// This represent the text that will be displayed in the alert toast with it's properties.
public struct AlertTextAppearance {
  /// The displayed text in the toast alert.
  public let text: String
  /// The color of the displayed ``text``.
  public let color: Color
  /// The font properties of the displayed text, which contains size, weight and font of the ``text``.
  public let font: Font
  
  public init(text: String, color: Color, font: Font = .system(size: 16, weight: .bold)) {
    self.text = text
    self.color = color
    self.font = font
  }
}
```

### AlertPosition <a name="sub-topic-1.5"></a>
`AlertPosition` is an `enum` that contains the possible positions avalible for the toast alert.

```swift
/// This enum represent the possible position options for the toast alert.
public enum AlertPosition {
  case topLeading
  case top
  case topTrailing
  
  internal var alignment : Alignment {
    switch self {
    case .topLeading:
        .topLeading
    case .top:
        .top
    case .topTrailing:
        .topTrailing
    }
  }
}
```

And that's all there is to it! 🚀 Enjoy using this Swifty package.

## Author <a name="conclusion"></a>
This pacakge was created by [Eng.Omar Elsayed](https://www.deveagency.com/) to help the iOS comuntity and make there life easir. 
To contact me email me at eng.omar.elsayed@hotmail.com











