![ArtSignProDemoOC:The demo for ArtSignProSdk](https://github.com/o0starshine0o/iOS-ArtSignProDemoOC/raw/master/doc/icon.png)

Fill your app with expert sign and share the order amount.

----------

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate ArtSignProSdk into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target '<Your Target Name>' do
pod 'ArtSignProSdk'
end
```

Then, run the following command:

```bash
$ pod install
```


----------


## Usage

### Prepare

#### 1.Get **Key** And **Secret**

- for **test** environment , please click **[Here][1]**
- for **production** environment , please click **[Here][2]**

> Our business platform use different account in test and production environment. So , you have to register in test and production

#### 2.Submit Business-Name, App-Identify and App-Version

> In our business platform , fill your business name , app identify and app version . 

### Xcode

#### 1.  info.plist > Add Schemes

```xml
<key>CFBundleURLTypes</key>
<array>
<dict>
<key>CFBundleTypeRole</key>
<string>Editor</string>
<key>CFBundleURLName</key>
<string></string>
<key>CFBundleURLSchemes</key>
<array>
<string>your app name</string>
</array>
</dict>
</array>
```
> please replace **your app name** with **Your App Name**

#### 2.  info.plist > Add Queries Schemes

```xml
<key>LSApplicationQueriesSchemes</key>
<array>
<string>weixin</string>
<string>wechat</string>
<string>alipay</string>
<string>alipays<string>
<string>mqq<string>
</array>
```

#### 3.  info.plist > Enable http

```xml
<key>NSAppTransportSecurity</key>
<dict>
<key>NSAllowsArbitraryLoads</key>
<true/>
</dict>
```

#### 4.AppDelegate.h > Import ArtSignProSdk , define variable

```Objective-C
#import <UIKit/UIKit.h>
@import ArtSignProSdk;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ArtSignPro * artsignpro;

···

@end
```

#### 5.AppDelegate.m > Init SDK and set environment 

```Objective-C
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.artsignpro = [[ArtSignPro alloc] initWithKey:@"key_XXX" secret:@"secret_XXX" scheme:@"ArtSignProSdkDemoOC"];
    [self.artsignpro setEnvironmentWithEnvironment:EnvironmentTypeTest];

    ···

    return YES;
}
```
> 1. the key and secret in [Prepare][3]
> 2. the scheme is **your app name** , when complete perchase , return to your app
> 3. the key and secret will be different in **Test** and **Production** environment
> 4. in **Test** environment the perchase is **free**
> 5. in **Production** environment the perchase will be **REAL**

#### 6.AppDelegate.m > Handle url

```Objective-C
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL*)url {
    return [self.artsignpro handleOpenWithUrl:url];
}
```

#### 7.ViewController.h > Import AppDelegate.h and ArtSignProSdk , define variable , implement ArtSignProSdkDelegate

```Objective-C
#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@import ArtSignProSdk;

@interface ViewController : UIViewController <ArtSignProSdkDelegate>

@property (strong, nonatomic) AppDelegate *delegate;

···

@end
```

#### 7.ViewController.m > Can we show?
import ArtSignProSdk
```Objective-C
import ArtSignProSdk

override func viewDidLoad() {
    [super viewDidLoad];
    self.delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    [self.delegate.artsignpro isShowSdkWithDelegate:self];

    ···
}
```
implement ArtSignProSdkDelegate
```Objective-C
@implementation ViewController

bool isShowSdk = false;

-(void)isShowSdkWithShow:(BOOL)show{
    isShowSdk = show;
}

···

@end
```
when some event happend eg:click,to show expert sign list or not
(this example is for storyboard)
```Objective-C
- (IBAction)onClick:(UIButton *)sender {
    if (isShowSdk) {
        [self performSegueWithIdentifier:@"ShowExpertSignList" sender:self];
    }else{
        NSLog(@"set pay method for this production before show expert sign list");
    }
}
```
when some event happend eg:click,to show expert sign list or not
(this example is for code)
```Objective-C
- (IBAction)onClick:(UIButton *)sender {
    if (isShowSdk) {
        NSBundle * artSignProBundle = [NSBundle bundleWithIdentifier:@"org.cocoapods.ArtSignProSdk"];
        UIStoryboard * artSignProStoryBoard = [UIStoryboard storyboardWithName:@"ArtSignPro" bundle:artSignProBundle];
        UIViewController * viewController =  [artSignProStoryBoard instantiateViewControllerWithIdentifier:@"ExpertSignListViewController"];
        [self showViewController:viewController sender:self];
    }else{
        NSLog(@"set pay method for this production before show expert sign list");
    }
}
```

#### 8.ViewController.swift > Show ViewController
please show **ExpertSignListViewController** with 
```
StoryBoard     >> ArtSignPro
Referenced ID  >> ExpertSignListViewController
Bundle         >> org.cocoapods.ArtSignProSdk
```


[1]: http://business.test.qima.tech/
[2]: http://business.qima.tech/
[3]: https://github.com/o0starshine0o/iOS-ArtSignProDemoOC#prepare
