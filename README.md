# RSGuideDemo

![](https://img.shields.io/badge/platform-iOS-red.svg) 
![](https://img.shields.io/badge/language-Swift-orange.svg) 
![](https://img.shields.io/badge/download-7.8MB-brightgreen.svg)
![](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg) 
![](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg) 

[EN](https://github.com/ReverseScale/RSGuidePageDemo) | [中文](https://github.com/ReverseScale/RSGuidePageDemo/blob/master/README_zh.md)

Use the Swift wrapper guide page feature to support the gallery and video playback situation guide page.

## 🎨 Why test the UI?

| 1.Photo Gallery | 2.Video Guide | 3.End of Guide |
| ------------- | ------------- | ------------- |
| ![](http://og1yl0w9z.bkt.clouddn.com/18-3-19/8674435.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/18-3-19/75290683.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/18-3-19/67729200.jpg) |
| Load an image array to show the guide page | Load an MP4 video show | Go to page after booting |


## 🚀 Getting started
* 1.Less files, simple code
* 2.Does not rely on any other third party library
* 3.Supports both local picture collections and local video
* 4.Highly customizable


## 🤖 Requirements

* iOS 9.0+
* Xcode 9.0+
* Swift 


## 🛠 Configuration
### Implementation Method in AppDelegate
Used in didFinishLaunchingWithOptions
```Swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        TestsetupGuideView()
        return true
    }
```

Test usage example (displayed every time)
```Swift
func TestsetupGuideView() {
        let videoPath = Bundle.main.path(forResource: "videoGuide", ofType: "mp4")
        let nav = UINavigationController.init(rootViewController: ViewController())
        
        // 多张图片引导页
        let guideVc = GuideController.init(guide: .picture, pictures: ["guide_1","guide_2","guide_3"], videoPath: nil,pushViewController:nav)
        self.window?.rootViewController = guideVc
    }
```

Actual usage scenario (displayed on the first run)
```Swift
/// 版本号判断 + 引导页
func setupGuideViewJudge() {
    // 得到当前应用的版本号
    let infoDictionary = Bundle.main.infoDictionary
    let currentAppVersion = infoDictionary!["CFBundleShortVersionString"] as! String
    // 取出之前保存的版本号
    let userDefaults = UserDefaults.standard
    let appVersion = userDefaults.string(forKey: "appVersion")

    let videoPath = Bundle.main.path(forResource: "videoGuide", ofType: "mp4")
    let naviVc = UINavigationController.init(rootViewController: ViewController())

    // 如果 appVersion 为 nil 说明是第一次启动；如果 appVersion 不等于 currentAppVersion 说明是更新了
    if appVersion == nil || appVersion != currentAppVersion {
        // 保存最新的版本号
        userDefaults.setValue(currentAppVersion, forKey: "appVersion")
        let guideVc = GuideController.init(guide: .video, pictures: nil, videoPath: videoPath,pushViewController:naviVc)
        self.window?.rootViewController = guideVc
    } else {
        self.window?.rootViewController = naviVc
    }
}
```

## ⚖ License

```
MIT License

Copyright (c) 2017 ReverseScale

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## 😬 Contributions

* WeChat : WhatsXie
* Email : ReverseScale@iCloud.com
* Blog : https://reversescale.github.io
