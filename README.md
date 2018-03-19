# RSGuideDemo
Swift 实现的引导页封装，支持多张图片和视频引导页

![](https://img.shields.io/badge/platform-iOS-red.svg) 
![](https://img.shields.io/badge/language-Swift-orange.svg) 
![](https://img.shields.io/badge/download-7.8MB-brightgreen.svg)
![](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg) 
![](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg) 

使用 Swift 封装的引导页功能，支持图片集和视频播放形势引导页。

|1.图片集 |2.视频引导 |3.引导结束 |
| ------------- | ------------- | ------------- |
| ![](http://og1yl0w9z.bkt.clouddn.com/18-3-19/8674435.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/18-3-19/75290683.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/18-3-19/67729200.jpg) |
| 加载图片数组展示引导页 | 加载一个 MP4 视频展示 | 引导结束后进入页面 |


## Advantage 框架的优势
* 1.文件少，代码简洁
* 2.不依赖任何其他第三方库
* 3.同时支持本地图片图片集和本地视频
* 4.具备较高自定义性


## Requirements 要求
* iOS 7+
* Xcode 8+


## Usage 使用方法
### AppDelegate 中实现方法
```
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


使用简单、效率高效、进程安全~~~如果你有更好的建议,希望不吝赐教!


## License 许可证
RSGuideDemo 使用 MIT 许可证，详情见 LICENSE 文件。


## Contact 联系方式:
* WeChat : WhatsXie
* Email : ReverseScale@iCloud.com
* Blog : https://reversescale.github.io
