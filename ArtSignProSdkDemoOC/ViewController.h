//
//  ViewController.h
//  ArtSignProSdkDemoOC
//
//  Created by AbelHu on 2016/12/5.
//  Copyright © 2016年 qicode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@import ArtSignProSdk;

@interface ViewController : UIViewController <ArtSignProSdkDelegate>

@property (strong, nonatomic) AppDelegate *delegate;

@end

