# iOS Blurred Snapshot Plugin for Apache Cordova

Use this plugin to keep sensitive information from views before moving to the background.
[As apple recommends](https://developer.apple.com/library/ios/documentation/iPhone/Conceptual/iPhoneOSProgrammingGuide/BackgroundExecution/BackgroundExecution.html#//apple_ref/doc/uid/TP40007072-CH4-SW8.)

Made with WWDC 2013 [UIImage+ImageEffects](https://developer.apple.com/library/ios/samplecode/UIImageEffects/Listings/UIImageEffects_UIImageEffects_h.html#//apple_ref/doc/uid/DTS40013396-UIImageEffects_UIImageEffects_h-DontLinkElementID_8)
iOS 8 [UIBlurEffect](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIBlurEffect_Ref/) is less configurable(No API for Radius)

![](https://raw.github.com/trykovyura/cordova-plugin-blurred-snapshot/master/blurredScreenShot.jpg)

## Install

### Locally

```
cordova plugin add https://github.com/trykovyura/cordova-plugin-blurred-snapshot.git
```

## Usage

Depends on application events: "pause" and "resume".
Apply plugin method "addBlurredSnapshot" on "pause" to add blurred snapshot for app.
Apply plugin method "removeBlurredSnapshot" on "resume" to remove  blurred snapshot.

### Example
```
 document.addEventListener('pause', onPause, false);
 document.addEventListener('resume', onResume, false);

 function onPause() {
    blurredsnapshot.addBlurredSnapshot();
 }

 function onResume() {
    blurredsnapshot.removeBlurredSnapshot();
 }
```

## Platform Support

iOS only. Tested in iOS7+, might work on older iOS versions

## License

MIT License