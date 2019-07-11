# React-Native-iOS-Action-Extension-Example

A example project of building iOS Action Extension with React Native 0.60+

### Objective-C Version

1. Generate React Native Project
   `npx react-native init RNActionExtension`

2. Create **Action Extension** target in XCode with this [commit](https://github.com/bit3725/React-Native-iOS-Action-Extension-Example/commit/e3c728072eefa1c7c2db0213911da5ef3006c70a)

3. Add ActionExt target in Podfile with this [commit](https://github.com/bit3725/React-Native-iOS-Action-Extension-Example/commit/a1df9ac858e73c80229a5f1a958aca1fbc0f9c70), then run pod install
   `cd RNActionExtension/ios && pod install`

4. Fix this error: _'sharedApplication' is unavailable: not available on iOS (App Extension)_ with this [commit](https://github.com/bit3725/React-Native-iOS-Action-Extension-Example/commit/048dd752ff315dd6a46f8d103ad4908a37acd866), then run pod install again.
   `cd RNActionExtension/ios && pod install`

5. Make sure Javascript bundle is allowed to be loaded with this [commit](https://github.com/bit3725/React-Native-iOS-Action-Extension-Example/commit/5c846eae9f9de563473df354003d4586c7def30f)

6. Can show React Native View with this [commit](https://github.com/bit3725/React-Native-iOS-Action-Extension-Example/commit/26585d215160bdb3231bff480cfb710723cf55d8)

7. Expose a method that can dismiss the extension to React Native view with this [commit](https://github.com/bit3725/React-Native-iOS-Action-Extension-Example/commit/606920737cc4b86029261c4b2883ca0012156b9a)

8. Dismiss the extension from React Native view with this [commit](https://github.com/bit3725/React-Native-iOS-Action-Extension-Example/commit/97272ba7ef0901164effdd5849686168eceb3efb)

9. Expose a method that can get action data from the extension to React Native view with this [commit](https://github.com/bit3725/React-Native-iOS-Action-Extension-Example/commit/0b157bdaed43d0e8e812221d5242db418f65a310)

10. Can show action data in React Native view with this [commit](https://github.com/bit3725/React-Native-iOS-Action-Extension-Example/commit/9f96693b691bf9c62a8281fec9ece132a2b4eaf9)

### Swift Version

1. Generate React Native Project
   `npx react-native init RNActionExtensionSwift`

2. Create **Action Extension** target in XCode with this [commit](https://github.com/bit3725/React-Native-iOS-Action-Extension-Example/commit/5ec98fc12da9763d1a734a82482f78b94ad2ec45)

3. Add Objective-C bridging header with this [commit](https://github.com/bit3725/React-Native-iOS-Action-Extension-Example/commit/3a08b95165ba4b2f657cf5c55c3fe36a3a45d787)

4. Add ActionExt target in Podfile with this [commit](https://github.com/bit3725/React-Native-iOS-Action-Extension-Example/commit/c203f4429d3959414fbf3083efd3a00335c94c82), then run pod install
   `cd RNActionExtensionSwift/ios && pod install`

5. Fix this error: _'sharedApplication' is unavailable: not available on iOS (App Extension)_ with this [commit](https://github.com/bit3725/React-Native-iOS-Action-Extension-Example/commit/37c3625760745f9b2aaffae5f53b1fb1a5e0e0e8), then run pod install again.
   `cd RNActionExtensionSwift/ios && pod install`

6. Make sure Javascript bundle is allowed to be loaded with this [commit](https://github.com/bit3725/React-Native-iOS-Action-Extension-Example/commit/b6ba702fb35fca5c56e11289ce1a7018f17b787e)

7. Can show React Native View with this [commit](https://github.com/bit3725/React-Native-iOS-Action-Extension-Example/commit/8a06d4cdd8961d5df7fd7180dd90effc7e3d00f1)

8. Expose a method that can dismiss the extension to React Native view with this [commit](https://github.com/bit3725/React-Native-iOS-Action-Extension-Example/commit/6d1f36820fd2b7d871bf055ddc40084a5cab8661)

9. Dismiss the extension from React Native view with this [commit](https://github.com/bit3725/React-Native-iOS-Action-Extension-Example/commit/870cfbfad899fbdebef96a8c57dc0e6c5723df71)

10. Expose a method that can get action data from the extension to React Native view with this [commit](https://github.com/bit3725/React-Native-iOS-Action-Extension-Example/commit/ca1fe13123828f89108d3ead6876038ded8bc799)

11. Can show action data in React Native view with this [commit](https://github.com/bit3725/React-Native-iOS-Action-Extension-Example/commit/de87f193a6534ad77cd0dca0dc6cbcb3ba0a2450)
