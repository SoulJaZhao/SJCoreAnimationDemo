//
//  ViewController.m
//  UIBezierPathDemo
//
//  Created by SDPMobile on 2017/10/24.
//  Copyright © 2017年 SoulJa. All rights reserved.
//

#import "ViewController.h"
#import "SJBezierPathView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    SJBezierPathView *subview = [[SJBezierPathView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:subview];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
