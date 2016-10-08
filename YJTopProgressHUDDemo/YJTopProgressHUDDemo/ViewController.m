//
//  ViewController.m
//  YJTopProgressHUDDemo
//
//  Created by YJHou on 2016/10/8.
//  Copyright © 2016年 YJHou. All rights reserved.
//

#import "ViewController.h"
#import "YJTopProgressHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [YJTopProgressHUD popHUDToView:self.view text:@"你在干嘛呢？" textFont:[UIFont systemFontOfSize:13.0f] textColor:[UIColor redColor] popViewBgColor:[UIColor greenColor] disappearMode:YJHUDDisappearModeNomalTopBack completionBlock:^{
        NSLog(@"Finish");
    } animated:YES];

}



@end
