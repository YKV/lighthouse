//
//  SecondViewController.m
//  test
//
//  Created by Yevhen Kim on 2016-07-13.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation SecondViewController

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    // Do any additional setup after loading the view.
    [self.delegate didTyped:self.textField.text];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



@end
