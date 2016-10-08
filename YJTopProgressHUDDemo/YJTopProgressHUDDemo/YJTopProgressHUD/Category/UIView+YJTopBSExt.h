//
//  UIView+YJTopBSExt.h
//  YiJianDoctor
//
//  Created by YJHou on 16/3/4.
//  Copyright © 2016年 YJHou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YJTopBSExt)

@property (nonatomic) CGFloat leftYJ;
@property (nonatomic) CGFloat topYJ;
@property (nonatomic) CGFloat rightYJ;
@property (nonatomic) CGFloat bottomYJ;
@property (nonatomic) CGFloat widthYJ;
@property (nonatomic) CGFloat heightYJ;

@property (nonatomic) CGPoint originYJ;
@property (nonatomic) CGSize sizeYJ;

- (void)topYJAdd:(CGFloat)add;
- (void)leftYJAdd:(CGFloat)add;
- (void)widthYJAdd:(CGFloat)add;
- (void)heightYJAdd:(CGFloat)add;

@end
