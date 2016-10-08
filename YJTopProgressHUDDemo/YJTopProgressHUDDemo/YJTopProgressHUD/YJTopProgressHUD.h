//
//  YJTopProgressHUD.h
//  YiJianDoctor
//
//  Created by YJHou on 16/3/4.
//  Copyright © 2016年 YJHou. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^YJTopProgressHUDCompletionBlock)();
typedef NS_ENUM(NSInteger, YJHUDDisappearMode){
    YJHUDDisappearModeGradually = 0,
    YJHUDDisappearModeBounceTopBack   = 1 << 1,
    YJHUDDisappearModeNomalTopBack    = 1<< 2
};

@interface YJTopProgressHUD : UIView

@property (nonatomic, copy) YJTopProgressHUDCompletionBlock completionBlock;
/** 从顶部pop出提示视图信息 */
+ (void)popHUDToView:(UIView *)view text:(NSString *)text textFont:(UIFont *)font textColor:(UIColor *)textColor popViewBgColor:(UIColor *)bgColor disappearMode:(YJHUDDisappearMode)disappearMode completionBlock:(YJTopProgressHUDCompletionBlock)completion animated:(BOOL)animated;

@end
