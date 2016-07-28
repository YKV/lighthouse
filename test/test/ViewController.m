//
//  ViewController.m
//  test
//
//  Created by Yevhen Kim on 2016-07-13.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()<SecondDelegate>
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    SecondViewController *second = [segue destinationViewController];
    second.delegate = self;
}

- (void)didTyped:(NSString *)string {
    self.label.text = string;
}

@end
