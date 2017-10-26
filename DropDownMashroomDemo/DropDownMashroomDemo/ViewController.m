//
//  ViewController.m
//  DropDownMashroomDemo
//
//  Created by SDPMobile on 2017/10/26.
//  Copyright © 2017年 SoulJa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIGravityBehavior *gravityBehavior;
@property (nonatomic, strong) UICollisionBehavior *collisionBehavior;
@property (nonatomic, strong) UIDynamicItemBehavior *itemBehavior;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(tapped:)];
    [self.view addGestureRecognizer:gesture];
    [self setUpDownMushroom];
}

- (void)dealloc {
    [self.animator removeAllBehaviors];
}

- (void)setUpDownMushroom {
    // 相当于一个容器，为下面动画提供上下文
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    // 重力
    self.gravityBehavior = [[UIGravityBehavior alloc] init];
    // 碰撞
    self.collisionBehavior = [[UICollisionBehavior alloc] init];
    // 碰撞边界为可碰撞边界
    self.collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    // 物体属性
    self.itemBehavior = [[UIDynamicItemBehavior alloc] init];
    self.itemBehavior.elasticity = 0.7;// 改变弹性
    self.itemBehavior.friction = 0.5;// 摩擦
    self.itemBehavior.resistance = 0.5;// 阻力
    
    [self.animator addBehavior:self.gravityBehavior];
    [self.animator addBehavior:self.collisionBehavior];
    [self.animator addBehavior:self.itemBehavior];
    
}

- (void)tapped:(UITapGestureRecognizer *)gesture {
    
    UIImage *image = [UIImage imageNamed:@"mushroom"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [self.view addSubview:imageView];
    
    CGPoint tappedPosition = [gesture locationInView:gesture.view];
    imageView.center = tappedPosition;
    
    [self.gravityBehavior addItem:imageView];
    [self.collisionBehavior addItem:imageView];
    [self.itemBehavior addItem:imageView];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
