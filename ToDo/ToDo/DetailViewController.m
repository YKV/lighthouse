//
//  DetailViewController.m
//  ToDo
//
//  Created by Yevhen Kim on 2016-07-12.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "DetailViewController.h"
#import "TaskModel.h"

@interface DetailViewController ()
@property (strong, nonatomic) IBOutlet UILabel *taskTitle;
@property (strong, nonatomic) IBOutlet UILabel *taskDescription;
@property (strong, nonatomic) IBOutlet UILabel *taskPriority;

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.taskTitle.text = [self.detailItem title];
        self.taskDescription.text = [self.detailItem taskDescription];
        self.taskPriority.text = [self.detailItem priority];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
