# TrackRecorder

[![Version](https://img.shields.io/cocoapods/v/TrackRecorder.svg?style=flat)](https://cocoapods.org/pods/TrackRecorder)
[![License](https://img.shields.io/cocoapods/l/TrackRecorder.svg?style=flat)](https://cocoapods.org/pods/TrackRecorder)
[![Platform](https://img.shields.io/cocoapods/p/TrackRecorder.svg?style=flat)](https://cocoapods.org/pods/TrackRecorder)

## Requirements
 - iOS 10.0+

## Usage

#### Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

#### Installation

TrackRecorder is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```objective-c
pod 'TrackRecorder'
```

#### Quick Start

##### 代码

- 首先需要引入头文件

`#import <TrackRecorder/TrackRecordManager.h>`

- 添加代理

`<TrackRecordDelegate>`

`TrackRecordManager.sharedInstance.delegate = **self**;`

- 实现代理方法

  ```objective-c
  - (void)TrackRecordClickWithDictionary:(nonnull NSDictionary *)dic {

      NSLog(@"click%@",dic);

  }
  - (void)TrackRecordVisitWithDictionary:(nonnull NSDictionary *)dic {

      NSLog(@"visit%@",dic);

  }

  ```

##### 配置文件

需要在本地项目中创建一个名为"TrackRecordConfig"的plist文件

文件格式如图：

![image-20190924192353616](/var/folders/93/6r2bj4_10v707g2n4459_q9m0000gn/T/abnerworks.Typora/image-20190924192353616.png)

使用方法：

- PageEvents：

在PageEvents下新建一个Dictionary，以Controller名字作为key（如果是swift项目需要在前面添加项目名称）

- ControlEvents：

在ControlEvents下新建一个Dictionary，以方法点击事件名称作为key，如果是swift代码需要将事件名称进行转换如：`@objc func countDownAction(sender: CountDownButton)` 转换为`countDownActionWithSender:` 

- CollectionViewEvents和TableViewEvents：

在TableViewEvents或CollectionViewEvents下新建Dictionary，section作为一级key，row作为二级key

- TapEvents：

在TapEvents下新建Dictionary，控制器名字作为一级key（如果是swift项目需要在前面加项目名称），加载手势的视图的tag作为二级key



## Author

eason, 18210437675@163.com

## License

TrackRecorder is available under the MIT license. See the LICENSE file for more info.
