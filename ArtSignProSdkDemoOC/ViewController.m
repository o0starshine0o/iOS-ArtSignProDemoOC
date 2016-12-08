//
//  ViewController.m
//  ArtSignProSdkDemoOC
//
//  Created by AbelHu on 2016/12/5.
//  Copyright © 2016年 qicode. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

bool isShowSdk = false;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    [self.delegate.artsignpro isShowSdkWithDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onClick:(UIButton *)sender {
    if (isShowSdk) {
        // if you use storyboard , you can show ArtSignPro with the follow code
//        [self performSegueWithIdentifier:@"ShowExpertSignList" sender:self];
        // if you don't use storyboard , you can show ArtSignPro with the follow code
        NSBundle * artSignProBundle = [NSBundle bundleWithIdentifier:@"org.cocoapods.ArtSignProSdk"];
        UIStoryboard * artSignProStoryBoard = [UIStoryboard storyboardWithName:@"ArtSignPro" bundle:artSignProBundle];
        UIViewController * viewController =  [artSignProStoryBoard instantiateViewControllerWithIdentifier:@"ExpertSignListViewController"];
        [self showViewController:viewController sender:self];
    }else{
        NSLog(@"set pay method for this production before show expert sign list");
    }
}

-(void)isShowSdkWithShow:(BOOL)show{
    isShowSdk = show;
}

@end
