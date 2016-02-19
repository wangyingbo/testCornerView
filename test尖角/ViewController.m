//
//  ViewController.m
//  test尖角
//
//  Created by 王迎博 on 16/2/5.
//  Copyright © 2016年 王迎博. All rights reserved.
//

#import "ViewController.h"
#import "test.h"
#import "YBCustomSharpView.h"


@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addTest];
    [self addCustomSharpView];
    
}


- (void)addTest
{
    CGFloat x = self.view.center.x;
    CGFloat y = self.view.center.y;
    test *tt = [[test alloc]init:CGPointMake(x, y) str:@"80 %"];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(x, y, 20, 40)];
    button.backgroundColor = [UIColor greenColor];
    [self.view addSubview:tt];
    [self.view addSubview:button];
}


- (void)addCustomSharpView
{
    CGFloat cernerX = self.view.center.x;
    CGFloat Y = 150;
    CGPoint point = CGPointMake(cernerX, Y);
    YBCustomSharpView *sharpView = [[YBCustomSharpView alloc]initSharpView:point WithCornerH:20 WithViewW:200 WithViewH:80];
    [self.view addSubview:sharpView];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end
