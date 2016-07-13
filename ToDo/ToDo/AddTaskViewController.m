//
//  AddTaskViewController.m
//  ToDo
//
//  Created by Yevhen Kim on 2016-07-12.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "AddTaskViewController.h"
#import "TaskModel.h"

@interface AddTaskViewController ()<UITextFieldDelegate,UITextViewDelegate,UIPickerViewDelegate,UIPickerViewDataSource>

@end

@implementation AddTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titleField.delegate = self;
    self.descriptionView.delegate = self;
    self.priorityPicker.delegate = self;
}


#pragma mark - Navigation

 //In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//     Get the new view controller using [segue destinationViewController].
//     Pass the selected object to the new view controller.
//}


#pragma mark - Pickering implementation
//return number of components
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
//return number of rows in component
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 3;
}
//return title of for each row
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (row == 0) {
        return @"Low";
    }
    else if (row == 1) {
        return @"Medium";
    }
    else if (row == 2) {
        return @"High";
    }
    return nil;
}
//
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.picker = [self.priorityPicker.delegate pickerView:self.priorityPicker titleForRow:[self.priorityPicker selectedRowInComponent:0] forComponent:0];
    
    
}

#pragma mark - Text Field Delegates

//text field
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

//text view
- (void)textViewDidChange:(UITextView *)textView {
}

//segment controller
- (IBAction)isCompleteController:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        self.isComplete = YES;
    }
    else if (sender.selectedSegmentIndex == 1) {
        self.isComplete = NO;
    }
}

#pragma mark - Bar buttons Delegates

- (IBAction)savePressed:(id)sender {
    TaskModel *task = [[TaskModel alloc]initWithTitle:self.titleField.text description:self.descriptionView.text number:self.picker completed:@selector(isCompleteController:)];
    [self.delegate didSaveNewTodo:task];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
