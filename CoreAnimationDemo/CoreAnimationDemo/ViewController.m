//
//  ViewController.m
//  CoreAnimationDemo
//
//  Created by SDPMobile on 2017/10/25.
//  Copyright © 2017年 SoulJa. All rights reserved.
//

#import "ViewController.h"
#import <CoreGraphics/CoreGraphics.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self test];
}

#pragma mark - 小试牛刀
- (void)test {
    // CALayer 执行者
    CALayer *myLayer = [[CALayer alloc] init];
    myLayer.backgroundColor = [UIColor greenColor].CGColor;
    myLayer.frame = CGRectMake(60, 20 + 100, 50, 50);
    myLayer.cornerRadius = 5;
    [self.view.layer addSublayer:myLayer];
    
    // CAAnimation 怎么做
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];// 注意  animationWithKeyPath后跟随的是CALayer可接受的Key即可 既使用动画的对象的Key
//    animation.fromValue = [NSValue valueWithCGPoint:myLayer.position];
//    CGPoint toValue = myLayer.position;
//    toValue.x += 200;
//    animation.toValue = [NSValue valueWithCGPoint:toValue];// 改变到最大值
    animation.fromValue = 0;
    animation.toValue = @(M_PI * 2);
    // 当你设定这个属性为 YES 时,在它到达目的地之后,动画的返回到开始的值,代替了直接跳转到 开始的值
    animation.autoreverses = NO;
    // 当动画结束后,layer会一直保持着动画最后的状态
    animation.fillMode = kCAFillModeForwards;
    // 重复的次数
    animation.repeatCount = MAXFLOAT;
    // 完成这个过程的总时间
    animation.duration = 2.0;
    //ADDAnimation 将上面两者结合
    [myLayer addAnimation:animation forKey:@"TheKeyWithDiffrenceOfAnimation"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
