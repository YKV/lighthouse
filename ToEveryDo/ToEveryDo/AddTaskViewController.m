//
//  AddTaskViewController.m
//  ToEveryDo
//
//  Created by Yevhen Kim on 2016-07-20.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "AddTaskViewController.h"
#import "Task.h"
#import "Task+CoreDataProperties.h"
#import "AppDelegate.h"


@interface AddTaskViewController () <UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (weak, nonatomic) IBOutlet UITextField *taskTitle;
@property (weak, nonatomic) IBOutlet UITextField *taskDescription;
@property (weak, nonatomic) IBOutlet UIPickerView *taskPriorityPicker;

@property (strong, nonatomic) NSString *priorityPickerLevel;
@property (strong, nonatomic) NSFetchedResultsController *fetchedReusltsController;

@end

@implementation AddTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //delegates
    self.taskTitle.delegate = self;
    self.taskDescription.delegate = self;
    self.taskPriorityPicker.delegate = self;
    
}


#pragma mark - Picker view implementation
//return number of components in picker view
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

//return number of rows in component
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 3;
}

//return title for each row
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

//selected row
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.priorityPickerLevel = [self.taskPriorityPicker.delegate pickerView:self.taskPriorityPicker titleForRow:[self.taskPriorityPicker selectedRowInComponent:0] forComponent:0];
}


#pragma mark - Save action

- (IBAction)saveTask:(id)sender {
    //manage object context of the task
    NSManagedObjectContext *taskContext = ((AppDelegate *)[UIApplication sharedApplication].delegate).managedObjectContext;
    //insert new task
    Task *newTask = [NSEntityDescription insertNewObjectForEntityForName:@"Task" inManagedObjectContext:taskContext];
    
    newTask.taskName = self.taskTitle.text;
    newTask.taskDescription = self.taskDescription.text;
    newTask.taskPriority = self.priorityPickerLevel;
    
    [taskContext save:nil];
    
    //dismiss the view controller
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - cancel action

- (IBAction)cancelAddTask:(id)sender {
    //dismiss the view controller
    [self.navigationController popToRootViewControllerAnimated:YES];
}



@end
