//
//  YJTopProgressHUD.m
//  YiJianDoctor
//
//  Created by YJHou on 16/3/4.
//  Copyright © 2016年 YJHou. All rights reserved.
//

#import "YJTopProgressHUD.h"
#import "UIView+YJTopBSExt.h"

#define YJTOPHUD_KEYWINDOW [UIApplication sharedApplication].keyWindow
#define DELAY_TIME 1.2

@interface YJTopProgressHUD ()

@end

@implementation YJTopProgressHUD

+ (void)popHUDToView:(UIView *)view text:(NSString *)text textFont:(UIFont *)font textColor:(UIColor *)textColor popViewBgColor:(UIColor *)bgColor disappearMode:(YJHUDDisappearMode)disappearMode completionBlock:(YJTopProgressHUDCompletionBlock)completion animated:(BOOL)animated{
    
    YJTopProgressHUD * YJHud = [[YJTopProgressHUD alloc] initWithFrame:CGRectMake(0, 0, view.bounds.size.width, 64)];
    YJHud.backgroundColor = bgColor;
    [YJTOPHUD_KEYWINDOW addSubview:YJHud];
    
    UILabel * textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, view.bounds.size.width, 44)];
    textLabel.textColor = textColor;
    textLabel.font = font;
    textLabel.textAlignment = NSTextAlignmentCenter;
    textLabel.text = text;
    [YJHud addSubview:textLabel];
    
    YJHud.completionBlock = completion;
    
    if (animated) {
        YJHud.bottomYJ = YJTOPHUD_KEYWINDOW.topYJ;
        [UIView animateWithDuration:0.3 animations:^{
            YJHud.topYJ = YJTOPHUD_KEYWINDOW.topYJ;
        } completion:^(BOOL finished) {
            switch (disappearMode) {
                case YJHUDDisappearModeGradually:{
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(DELAY_TIME * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        [UIView animateWithDuration:0.3 animations:^{
                            YJHud.alpha = 0;
                        } completion:^(BOOL finished) {
                            if (YJHud.completionBlock) {
                                YJHud.completionBlock();
                            }
                            [YJHud removeFromSuperview];
                        }];
                    });
                    break;
                }
                case YJHUDDisappearModeNomalTopBack:{
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(DELAY_TIME * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        [UIView animateWithDuration:0.3 animations:^{
                            YJHud.bottomYJ = YJTOPHUD_KEYWINDOW.topYJ;
                        } completion:^(BOOL finished) {
                            if (YJHud.completionBlock) {
                                YJHud.completionBlock();
                            }
                            [YJHud removeFromSuperview];
                        }];
                    });
                    break;
                }
                    
                case YJHUDDisappearModeBounceTopBack:{
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.001 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        [YJHud popViewBackSomeAction:YJHud];
                    });
                    break;
                }
                default:
                    break;
            }
        }];
        
    }else{
        
        YJHud.topYJ = YJTOPHUD_KEYWINDOW.topYJ;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(DELAY_TIME * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.0001 animations:^{
                YJHud.alpha = 0;
            } completion:^(BOOL finished) {
                if (YJHud.completionBlock) {
                    YJHud.completionBlock();
                }
                [YJHud removeFromSuperview];
            }];
        });
    }
}

- (void)popViewBackSomeAction:(YJTopProgressHUD *)YJHud{
    
    [UIView animateWithDuration:0.08 animations:^{
        YJHud.topYJ = YJTOPHUD_KEYWINDOW.topYJ - 10;
    } completion:^(BOOL finished) {
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.005 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
             [YJHud popViewBackSomeRecoveryAction:YJHud];
        });
    }];
}
- (void)popViewBackSomeRecoveryAction:(YJTopProgressHUD *)YJHud{
    
    [UIView animateWithDuration:0.1 animations:^{
        YJHud.topYJ = YJTOPHUD_KEYWINDOW.topYJ;
    } completion:^(BOOL finished) {
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(DELAY_TIME * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
             [YJHud popViewFinishedAction:YJHud];
        });
    }];
}

- (void)popViewFinishedAction:(YJTopProgressHUD *)YJHud{
    [UIView animateWithDuration:0.3 animations:^{
        YJHud.bottomYJ = YJTOPHUD_KEYWINDOW.topYJ;
    } completion:^(BOOL finished) {
        if (YJHud.completionBlock) {
            YJHud.completionBlock();
        }
    }];
}

@end
