//
//  AddTaskViewController.h
//  ToDo
//
//  Created by Yevhen Kim on 2016-07-12.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskModel.h"

//create a delegate protocol
@protocol AddTaskViewControllerDelegate <NSObject>

- (void)didSaveNewTodo:(TaskModel *)todoTask;

@end

@interface AddTaskViewController : UIViewController

@property (nonatomic, strong) id<AddTaskViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *titleField;

@property (weak, nonatomic) IBOutlet UITextView *descriptionView;
@property (weak, nonatomic) IBOutlet UIPickerView *priorityPicker;
@property (nonatomic) BOOL isComplete;
@property (strong, nonatomic) NSString *picker;

@end
