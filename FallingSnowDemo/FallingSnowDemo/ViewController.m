//
//  ViewController.m
//  FallingSnowDemo
//
//  Created by SDPMobile on 2017/10/25.
//  Copyright © 2017年 SoulJa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(fallingSnow) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

#pragma mark - 雪花飘落
- (void)fallingSnow {
    // 图片
    UIImageView* fallingSnowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"snow"]];
    // 位置（横向距离的改变）
    CGFloat startX = roundf(random() % (int)self.view.frame.size.width);
    CGFloat endX = roundf(random() % (int)self.view.frame.size.width);
    // 大小比例和速度 的微调
    CGFloat scale = 1 / round(random() % 100) + 1.0;
    CGFloat speed = 1 / round(random() % 100) + 1.0;
    // 大小和透明
    fallingSnowView.frame = CGRectMake(startX, -100.0, 25.0 * scale, 25.0 * scale);
    fallingSnowView.alpha = 0.5;
    [self.view addSubview:fallingSnowView];
    // 动画效果
    [UIView animateWithDuration:5*speed animations:^{
        fallingSnowView.frame = CGRectMake(endX, self.view.frame.size.height, 25.0 * scale, 25.0 * scale);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
