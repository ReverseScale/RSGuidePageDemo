# RSGuideDemo

![](https://img.shields.io/badge/platform-iOS-red.svg) 
![](https://img.shields.io/badge/language-Swift-orange.svg) 
![](https://img.shields.io/badge/download-7.8MB-brightgreen.svg)
![](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg) 
![](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg) 

[EN](https://github.com/ReverseScale/RSGuidePageDemo) | [中文](https://github.com/ReverseScale/RSGuidePageDemo/blob/master/README_zh.md)

使用 Swift 封装的引导页功能，支持图片集和视频播放形势引导页。

## 🎨 测试 UI 什么样子？
|1.图片集 |2.视频引导 |3.引导结束 |
| ------------- | ------------- | ------------- |
| ![](http://ghexoblogimages.oss-cn-beijing.aliyuncs.com/18-11-22/38048448.jpg) | ![](http://ghexoblogimages.oss-cn-beijing.aliyuncs.com/18-11-22/67886214.jpg) | ![](http://ghexoblogimages.oss-cn-beijing.aliyuncs.com/18-11-22/9174873.jpg) |
| 加载图片数组展示引导页 | 加载一个 MP4 视频展示 | 引导结束后进入页面 |


## 🚀 准备开始
* 1.文件少，代码简洁
* 2.不依赖任何其他第三方库
* 3.同时支持本地图片图片集和本地视频
* 4.具备较高自定义性


## 🤖 要求

* iOS 9.0+
* Xcode 9.0+
* Swift 

## 🛠 配置
### AppDelegate 中实现方法
在 didFinishLaunchingWithOptions 中使用
```Swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        TestsetupGuideView()
        return true
    }
```

测试使用示例（每次都显示）
```Swift
func TestsetupGuideView() {
        let videoPath = Bundle.main.path(forResource: "videoGuide", ofType: "mp4")
        let nav = UINavigationController.init(rootViewController: ViewController())
        
        // 多张图片引导页
        let guideVc = GuideController.init(guide: .picture, pictures: ["guide_1","guide_2","guide_3"], videoPath: nil,pushViewController:nav)
        self.window?.rootViewController = guideVc
    }
```

实际使用场景（第一次运行时显示）
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

## ⚖ 协议

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

## 😬  联系

* 微信 : WhatsXie
* 邮件 : ReverseScale@iCloud.com
* 博客 : https://reversescale.github.io

