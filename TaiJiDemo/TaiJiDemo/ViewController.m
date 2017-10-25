//
//  ViewController.m
//  TaiJiDemo
//
//  Created by SDPMobile on 2017/10/25.
//  Copyright © 2017年 SoulJa. All rights reserved.
//

#import "ViewController.h"
#import "TaiJiView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    TaiJiView *taiJiView = [[TaiJiView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [self.view addSubview:taiJiView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
