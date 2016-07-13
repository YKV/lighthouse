//
//  ViewController.m
//  MyScrollView
//
//  Created by Yevhen Kim on 2016-07-11.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "ViewController.h"
#import "MyScrollView.h"

@interface ViewController ()<UIGestureRecognizerDelegate>



@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    MyScrollView *mainView = [[MyScrollView alloc]initWithFrame:self.view.bounds];
    mainView.contentSize = CGSizeMake(CGRectGetWidth(self.view.frame), 2*CGRectGetHeight(self.view.frame));
    [self.view addSubview:mainView];
    
    UIView *redView = [[UIView alloc]initWithFrame:CGRectMake(20, 20, 100, 100)];
    UIView *greenView = [[UIView alloc]initWithFrame:CGRectMake(150, 150, 150, 200)];
    UIView *blueView = [[UIView alloc]initWithFrame:CGRectMake(40, 400, 200, 150)];
    UIView *yellowView = [[UIView alloc]initWithFrame:CGRectMake(100, 600, 180, 150)];
    
    redView.backgroundColor = [UIColor redColor];
    greenView.backgroundColor = [UIColor greenColor];
    blueView.backgroundColor = [UIColor blueColor];
    yellowView.backgroundColor = [UIColor yellowColor];
    
    [mainView addSubview:redView];
    [mainView addSubview:greenView];
    [mainView addSubview:blueView];
    [mainView addSubview:yellowView];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
