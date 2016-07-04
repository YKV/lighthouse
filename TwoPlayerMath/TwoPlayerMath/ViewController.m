//
//  ViewController.m
//  TwoPlayerMath
//
//  Created by Yevhen Kim on 2016-07-04.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "ViewController.h"
#import "Player.h"
#import "GameModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.mathQuestion = [[GameModel alloc]init];
    self.question.text = [self.mathQuestion generateQuestion];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
