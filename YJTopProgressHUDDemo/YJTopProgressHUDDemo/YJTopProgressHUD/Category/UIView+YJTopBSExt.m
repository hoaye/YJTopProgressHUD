//
//  UIView+YJTopBSExt.m
//  YiJianDoctor
//
//  Created by YJHou on 16/3/4.
//  Copyright © 2016年 YJHou. All rights reserved.
//

#import "UIView+YJTopBSExt.h"

@implementation UIView (YJTopBSExt)

// leftYJ
- (CGFloat)leftYJ{
    return self.frame.origin.x;
}
-(void)setLeftYJ:(CGFloat)leftYJ{
    CGRect frame = self.frame;
    frame.origin.x = leftYJ;
    self.frame = frame;
}
-(void)leftYJAdd:(CGFloat)add{
    CGRect frame = self.frame;
    frame.origin.x += add;
    self.frame = frame;
}

// topYJ
- (CGFloat)topYJ{
    return self.frame.origin.y;
}
-(void)setTopYJ:(CGFloat)topYJ{
    CGRect frame = self.frame;
    frame.origin.y = topYJ;
    self.frame = frame;
}

- (void)topYJAdd:(CGFloat)add{
    CGRect frame = self.frame;
    frame.origin.y += add;
    self.frame = frame;
}

// rightYJ
- (CGFloat)rightYJ {
    return self.frame.origin.x + self.frame.size.width;
}
- (void)setRightYJ:(CGFloat)rightYJ{
    CGRect frame = self.frame;
    frame.origin.x = rightYJ - frame.size.width;
    self.frame = frame;
}

// bottomYJ
- (CGFloat)bottomYJ {
    return self.frame.origin.y + self.frame.size.height;
}
- (void)setBottomYJ:(CGFloat)bottomYJ{
    CGRect frame = self.frame;
    frame.origin.y = bottomYJ - frame.size.height;
    self.frame = frame;
}

//widthYJ
- (CGFloat)widthYJ {
    return self.frame.size.width;
}
- (void)setWidthYJ:(CGFloat)widthYJ{
    CGRect frame = self.frame;
    frame.size.width = widthYJ;
    self.frame = frame;
}
- (void)widthYJAdd:(CGFloat)add{
    CGRect frame = self.frame;
    frame.size.width += add;
    self.frame = frame;
}

// heightYJ
- (CGFloat)heightYJ {
    return self.frame.size.height;
}
- (void)setHeightYJ:(CGFloat)heightYJ{
    CGRect frame = self.frame;
    frame.size.height = heightYJ;
    self.frame = frame;
}
- (void)heightYJAdd:(CGFloat)add{
    CGRect frame = self.frame;
    frame.size.height += add;
    self.frame = frame;
}

// originYJ
- (CGPoint)originYJ{
    return self.frame.origin;
}
- (void)setOriginYJ:(CGPoint)originYJ{
    CGRect frame = self.frame;
    frame.origin = originYJ;
    self.frame = frame;
}

// sizeYJ
- (CGSize)sizeYJ{
    return self.frame.size;
}
- (void)setSizeYJ:(CGSize)sizeYJ{
    CGRect frame = self.frame;
    frame.size = sizeYJ;
    self.frame = frame;
}
@end
