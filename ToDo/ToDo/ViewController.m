//
//  ViewController.m
//  ToDo
//
//  Created by Yevhen Kim on 2016-07-12.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "ViewController.h"
#import "TaskViewCell.h"
#import "DetailViewController.h"
#import "TaskModel.h"
#import "AddTaskViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, AddTaskViewControllerDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *todos;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //allocate an d initialize todos array
    self.todos = [[NSMutableArray alloc]init];

    TaskModel *task1 = [[TaskModel alloc]initWithTitle:@"Buy milk" description:@"buy milk in Sobeys" number:@"high" completed:NO];
    TaskModel *task2 = [[TaskModel alloc]initWithTitle:@"Clean room" description:@"Clean with vacum cleaner" number:@"medium" completed:NO];
    TaskModel *task3 = [[TaskModel alloc]initWithTitle:@"Buy bread" description:@"buy bread in Sobeys" number:@"low" completed:YES];
    
    [self.todos addObject:task1];
    [self.todos addObject:task2];
    [self.todos addObject:task3];
    
    
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showDetails"]) {
        NSIndexPath *selectedPath = [self.tableView indexPathForSelectedRow];
        TaskModel *task = self.todos[selectedPath.row];
        DetailViewController *details = (DetailViewController *)[segue destinationViewController];
        [details setDetailItem:task];
        
    }
    if ([segue.identifier isEqualToString:@"addTask"]) {
        UINavigationController *nav = segue.destinationViewController;
        AddTaskViewController *addVC = nav.viewControllers[0];
        addVC.delegate = self;
    }
}


#pragma mark - Saving Module

- (void)didSaveNewTodo:(TaskModel *)todoTask {
    [self.todos addObject:todoTask];
    [self.tableView reloadData];
}

#pragma mark - TableView Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return number of rows that is equal to number of task we have in todos mutable array
    return self.todos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //set identifier name
    NSString *cellIdentifier = @"taskCell";
    
    //create an instance of TaskViewCell class and attach it to cell identifier
    TaskViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    //get title, description and priority, isComplete from todos
    TaskModel *task = self.todos[indexPath.row];
    
    //check isCompletedIndicator
    if (task.isCompletedIndicator) {
        NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc]initWithString:task.title];
        [attributeString addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInt:2] range:NSMakeRange(0,[attributeString length])];
        cell.title.attributedText = attributeString;
        cell.taskDescription.attributedText = attributeString;
        cell.priority.attributedText = attributeString;
    } else {
        cell.title.text = task.title;
        cell.taskDescription.text = task.taskDescription;
        cell.priority.text = task.priority;
    }

    return cell;
}

#pragma mark - UITableViewDelegate

- (NSArray *)tableView:(UITableView*)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewRowAction *completeAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Complete" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        //set identifier name
        
        //create an instance of TaskViewCell class and attach it to cell identifier
        TaskModel *checkTask = [self.todos objectAtIndex:indexPath.row];
        checkTask.isCompletedIndicator = YES;
        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }];
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Delete" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        [self.todos removeObjectAtIndex:indexPath.row];
        [self.tableView setEditing:NO animated:YES];
        [self.tableView reloadData];
    }];
    
    return @[completeAction, deleteAction];
}

//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        //delete row from data source
//        [self.todos removeObjectAtIndex:indexPath.row];
//        [self.tableView setEditing:NO animated:YES];
//        [self.tableView reloadData];
//    }
//}
//- (IBAction)Edit:(id)sender {
//    [self.tableView setEditing:YES animated:YES];
//    [self dismissViewControllerAnimated:YES completion:nil];
//}


@end
