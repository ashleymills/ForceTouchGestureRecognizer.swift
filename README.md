# ForceTouchGestureRecognizer.swift
UIGestureRecognizer Swift subclass enabling 3D Touch
## Installation
### CocoaPods
[CocoaPods][] is a dependency manager for Cocoa projects. To install ForceTouchGestureRecognizer.swift with CocoaPods:

 1. Make sure CocoaPods is [installed][CocoaPods Installation].

 2. Update your Podfile to include the following:

    ``` ruby
    pod 'ForceTouchGestureRecognizerSwift', git: 'https://github.com/ashleymills/ForceTouchGestureRecognizer.swift'
    ```

 3. Run `pod install`.

[CocoaPods]: https://cocoapods.org
[CocoaPods Installation]: https://guides.cocoapods.org/using/getting-started.html#getting-started

### Manual
Just drop the **ForceTouchGestureRecognizer.swift** file into your project. That's it!

## Example use

````
        override func viewDidLoad() {
            super.viewDidLoad()
       
            let forceTouchGesture = ForceTouchGestureRecognizer()
            forceTouchGesture.addTarget(self, action: "pressView:")
            forceTouchGesture.minimumValue = 0.1 // Minimum force value before touch is recognised 
            view.addGestureRecognizer(forceTouchGesture)
        }
        
        func pressView(gesture: ForceTouchGestureRecognizer) {
            print("force: \(gesture.forceValue)")  // forceVouch is CGFloat between 0 & 1
        }
````

## Want to help?

Got a bug fix, or a new feature? Create a pull request and go for it!

Cheers,
Ash

