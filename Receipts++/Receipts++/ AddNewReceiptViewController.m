//
//  AddNewReceiptViewController.m
//  Receipts++
//
//  Created by Yevhen Kim on 2016-07-21.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "AddNewReceiptViewController.h"
#import "Tag.h"
#import "TagTableViewCell.h"
#import "Receipt.h"
#import "AppDelegate.h"

@interface AddNewReceiptViewController ()

@property (nonatomic)NSArray<Tag*>* tagArray;
@property (nonatomic)NSIndexPath *checkedIndexPath;
@property (nullable, nonatomic, retain) NSOrderedSet<Receipt *> *receipts;
@property (nonatomic)NSOrderedSet *tagsSet;

@end

@implementation AddNewReceiptViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.allowsMultipleSelection = YES;
    NSManagedObjectContext *context = ((AppDelegate *)[UIApplication sharedApplication].delegate).managedObjectContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Tag"];
    
    //sort an array
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]initWithKey:@"tagName" ascending:YES];
    [request setSortDescriptors:@[sortDescriptor]];
    
    self.tagArray = [context executeFetchRequest:request error:nil];
    [self.tableView reloadData];
}


#pragma mark - Tag TableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tagArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"tagCell";
    TagTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    Tag *tag = self.tagArray[indexPath.row];
    cell.tagViewCell.text = tag.tagName;
    cell.backgroundColor = [UIColor redColor];
    //check if the cell is selected then show checkmark
    if ([self.checkedIndexPath isEqual:indexPath]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }

    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *sectionName = @"Category";
    return sectionName;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //unchecked previous checked row
    if (self.checkedIndexPath) {
        UITableViewCell *uncheckCell = [tableView cellForRowAtIndexPath:self.checkedIndexPath];
        uncheckCell.accessoryType = UITableViewCellAccessoryNone;
        
    }
}



- (IBAction)cancel:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)save:(id)sender {
    NSManagedObjectContext *receiptContext = ((AppDelegate *)[UIApplication sharedApplication].delegate).managedObjectContext;
    //insert new receipt
    Receipt *newReceipt = [NSEntityDescription insertNewObjectForEntityForName:@"Receipt" inManagedObjectContext:receiptContext];
    newReceipt.note = self.note.text;
    newReceipt.amount = [NSDecimalNumber decimalNumberWithString:self.amount.text];
    newReceipt.timeStamp = self.datePicker.date;
    
    //get index paths for selected rows(tags)
    NSArray *indexPaths = self.tableView.indexPathsForSelectedRows;
    //create an mutable array of Tag instance
    NSMutableArray<Tag*> *resultArray = [NSMutableArray new];
    //create a sort descriptor
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"tagName" ascending:YES];
    //loop through mutable array and add object to resultArray
    for (NSIndexPath *indexPath in indexPaths) {
        Tag *tag = self.tagArray[indexPath.row];
        [resultArray addObject:tag];
    }
    //sort resultArray with descriptor
    NSArray *sortedArray = [resultArray sortedArrayUsingDescriptors:@[sortDescriptor]];
    //create ordered set
    NSOrderedSet *resultSet = [NSOrderedSet orderedSetWithArray:sortedArray];

    //we want to add tags array to receipt object
    newReceipt.tags = resultSet;
    [receiptContext save:nil];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
