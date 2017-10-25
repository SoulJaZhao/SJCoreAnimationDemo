//
//  TaiJiView.m
//  TaiJiDemo
//
//  Created by SDPMobile on 2017/10/25.
//  Copyright © 2017年 SoulJa. All rights reserved.
//

#import "TaiJiView.h"

@implementation TaiJiView{
    NSTimer *_timer;
    CGFloat _currentRotate; // 当前旋转偏移
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        _currentRotate = 0.0;
        self.backgroundColor = [UIColor clearColor];
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.05f target:self selector:@selector(updateRotate) userInfo:nil repeats:YES];
    }
    return self;
}

- (void)dealloc {
    [_timer invalidate];
    _timer = nil;
}

- (void)updateRotate {
    _currentRotate += 0.01;
    // setNeedsDisplay会调用自动调用drawRect方法
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    
    // 获取中心点
    CGFloat x = self.frame.size.width/2;
    CGFloat y = self.frame.size.height/2;
    // 获取真正的半径
    CGFloat radius = MIN(x, y);
    // 设置当前的偏移量
    CGFloat runAngle = M_PI*_currentRotate;
    if (runAngle >= 2*M_PI) {
        runAngle -= 2*M_PI;
    }
    // 开始画
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 经典的黑白颜色
    CGColorRef  whiteColor =[[UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:1.0f] CGColor];
    CGColorRef  blackColor =[[UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:1.0f] CGColor];
    /*
     CGContextAddArc(CGContextRef __nullable c, CGFloat x, CGFloat y,
     CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise)
     注意： startAngle： 开始角度
     endAngle ：结束角度
     clockwise: 0 为顺时针，1 逆时针
     **/
    
    // 获取下部分白色的半圆（假设第一次时）
    CGContextSetFillColor(context, CGColorGetComponents(whiteColor));
    CGContextAddArc(context, x, y, radius, 0+runAngle, M_PI+runAngle, 0);
    CGContextClosePath(context);
    CGContextFillPath(context);
    
    // 获取上部分黑色的半圆
    CGContextSetFillColor(context, CGColorGetComponents( blackColor));
    CGContextAddArc(context, x, y, radius, M_PI+runAngle, M_PI*2+runAngle, 0);
    CGContextClosePath(context);
    CGContextFillPath(context);
    
    //再画右边上部分白色的半圆
    CGContextSetFillColor(context, CGColorGetComponents( whiteColor));
    CGContextAddArc(context, x+radius/2*cos(runAngle), y+radius/2*sin(runAngle), radius/2, M_PI+runAngle, M_PI*2+runAngle, 0);
    CGContextClosePath(context);
    CGContextFillPath(context);
    
    // 再画左边下部分黑色的半圆
    CGContextSetFillColor(context, CGColorGetComponents(blackColor));
    CGContextAddArc(context, x-radius/2*cos(runAngle), y-radius/2*sin(runAngle), radius/2, 0+runAngle, M_PI+runAngle, 0);
    CGContextClosePath(context);
    CGContextFillPath(context);
    
    // 再画两条半径，相当于分割线
    CGContextSetStrokeColorWithColor(context, whiteColor);
    CGContextMoveToPoint(context, x+radius*cos(runAngle), y+radius*sin(runAngle));
    CGContextAddLineToPoint(context, x, y);
    CGContextStrokePath(context);
    
    CGContextSetStrokeColorWithColor(context, blackColor);
    CGContextMoveToPoint(context, x-radius*cos(runAngle), y-radius*sin(runAngle));
    CGContextAddLineToPoint(context, x, y);
    CGContextStrokePath(context);
    
    // 再下面就是两个小圆啦
    CGContextSetFillColor(context, CGColorGetComponents( whiteColor));
    CGContextAddArc(context, x-radius/2*cos(runAngle), y-radius/2*sin(runAngle), radius/4, 0, M_PI*2, 0);
    CGContextClosePath(context);
    CGContextFillPath(context);
    
    CGContextSetFillColor(context, CGColorGetComponents( blackColor));
    CGContextAddArc(context, x+radius/2*cos(runAngle), y+radius/2*sin(runAngle), radius/4, 0, M_PI*2, 0);
    CGContextClosePath(context);
    CGContextFillPath(context);
}

@end
