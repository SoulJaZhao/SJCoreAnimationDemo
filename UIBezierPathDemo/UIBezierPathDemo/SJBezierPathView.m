//
//  SJBezierPathView.m
//  UIBezierPathDemo
//
//  Created by SDPMobile on 2017/10/24.
//  Copyright © 2017年 SoulJa. All rights reserved.
//

#import "SJBezierPathView.h"

@implementation SJBezierPathView
- (void)drawRect:(CGRect)rect {
//    [self drawLine];
//    [self drawBezierRect];
//    [self drawOval];
//    [self drawArc];
    [self drawBezierPath];
}


#pragma mark - 画直线
- (void)drawLine {
    // 设置颜色
    UIColor *lineColor = [UIColor redColor];
    [lineColor setStroke];
    // 设置路径
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    // 设置直线
    aPath.lineWidth = 2.0;// 线宽
    aPath.lineJoinStyle = kCGLineCapRound;// 转角样式
    aPath.lineCapStyle = kCGLineCapRound;// 终点样式
    // 设置起点
    [aPath moveToPoint:CGPointMake(100, 100)];
    // 设置连线
    [aPath addLineToPoint:CGPointMake(100, 300)];
    [aPath addLineToPoint:CGPointMake(300, 300)];
    [aPath addLineToPoint:CGPointMake(300, 100)];
    // 封闭路径
    [aPath closePath];
    // 连线
    [aPath stroke];
}

#pragma mark - 绘制矩形
- (void)drawBezierRect {
    // 设置颜色
    UIColor *rectColor = [UIColor redColor];
    [rectColor set];
    // 设置贝塞尔路径
    UIBezierPath *aPath = [UIBezierPath bezierPathWithRect:CGRectMake(100, 100, 100, 100)];
    // 设置线宽
    aPath.lineWidth = 2.0;
    // 处理线条
    aPath.lineJoinStyle = kCGLineCapRound;// 转角样式
    aPath.lineCapStyle = kCGLineCapRound;// 终点样式
    // 填充
    [aPath fill];
}

#pragma mark - 绘制圆形
- (void)drawOval {
    // 设置颜色
    UIColor *ovalColor = [UIColor redColor];
    [ovalColor set];
    // 设置贝塞尔路径
    UIBezierPath *aPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 200, 200)];
    // 设置线宽
    aPath.lineWidth = 2.0;
    // 处理线条
    aPath.lineJoinStyle = kCGLineCapRound;// 转角样式
    aPath.lineCapStyle = kCGLineCapRound;// 终点样式
    // 填充
    [aPath fill];
}

#pragma mark - 绘制圆弧
- (void)drawArc {
    // 设置颜色
    UIColor *arcColor = [UIColor redColor];
    [arcColor set];
    // 设置贝塞尔路径
    UIBezierPath *aPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100) radius:100 startAngle:0 endAngle:M_PI clockwise:YES];
    // 设置线宽
    aPath.lineWidth = 2.0;
    // 处理线条
    aPath.lineJoinStyle = kCGLineCapRound;// 转角样式
    aPath.lineCapStyle = kCGLineCapRound;// 终点样式
    // 填充
    [aPath fill];
}

#pragma mark - 绘制贝塞尔曲线
- (void)drawBezierPath {
    // 设置颜色
    UIColor *arcColor = [UIColor redColor];
    [arcColor set];
    // 设置贝塞尔路径
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    [aPath moveToPoint:CGPointMake(50, 100)];
//    [aPath addQuadCurveToPoint:CGPointMake(300, 120) controlPoint:CGPointMake(100, 20)];
    [aPath addCurveToPoint:CGPointMake(300, 50) controlPoint1:CGPointMake(120, 30) controlPoint2:CGPointMake(230, 200)];
    // 设置线宽
    aPath.lineWidth = 2.0;
    // 处理线条
    aPath.lineJoinStyle = kCGLineCapRound;// 转角样式
    aPath.lineCapStyle = kCGLineCapRound;// 终点样式
    // 填充
    [aPath fill];
}
@end
