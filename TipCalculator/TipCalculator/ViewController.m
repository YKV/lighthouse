//
//  ViewController.m
//  TipCalculator
//
//  Created by Yevhen Kim on 2016-07-08.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;
@property (weak, nonatomic) IBOutlet UITextField *tipPercentageTextField;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self customizeKeyBoard];
    [self setupTextField];
    [self addKeyboardObserver];
    
}

#pragma mark - Keyboard Methods

- (void)customizeKeyBoard {
    self.billAmountTextField.keyboardType = UIKeyboardTypeNumberPad;
    self.tipPercentageTextField.keyboardType = UIKeyboardTypeNumberPad;
}

- (void)setupTextField {
    self.billAmountTextField.delegate = self;
}

- (void)addKeyboardObserver {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillShowNotification object:nil];
}

- (void)keyboardWillShow:(NSNotification *)notification {
    CGFloat keyboardHeight = [self heightForNotification:notification];
    [self adjustViewForKeyboardHeight:keyboardHeight];
}

-(CGFloat)heightForNotification:(NSNotification *)notification {
    NSValue *keyboardInfo = notification.userInfo[UIKeyboardFrameEndUserInfoKey];
    CGRect rect = [keyboardInfo CGRectValue];
    return rect.size.height;
}

- (void)adjustViewForKeyboardHeight:(CGFloat)height {
    CGRect viewBounds = self.view.bounds;
    viewBounds.origin.y += (height/6);
    self.view.bounds = viewBounds;
}

- (void)keyboardWillHide:(NSNotification *)notification {
    CGFloat keyboardHeight = [self heightForNotification:notification];
    [self adjustViewForKeyboardHeight:-keyboardHeight];
}

#pragma mark - gesture handler
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if ([self.billAmountTextField isFirstResponder]) {
        [self.billAmountTextField resignFirstResponder];
    }
}

#pragma mark - delegate methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}



#pragma mark - calculation method

- (IBAction)calculateTip:(UIButton *)sender {
    
    float userInputAmount = [self.billAmountTextField.text floatValue];
    float userInputPercent = [self.tipPercentageTextField.text floatValue];
    
    float tipAmount = userInputPercent * userInputAmount / 100;
   

    self.tipAmountLabel.text = [NSString stringWithFormat:@"Tip amount is %.02f",tipAmount];
    [self.tipPercentageTextField resignFirstResponder];
}

@end
