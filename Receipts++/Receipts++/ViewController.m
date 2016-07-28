//
//  ViewController.m
//  Receipts++
//
//  Created by Yevhen Kim on 2016-07-21.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "ViewController.h"
#import "AddNewReceiptViewController.h"
#import "Tag.h"
#import "TagTableViewCell.h"
#import "Receipt.h"
#import "AppDelegate.h"
#import "ReceiptTableViewCell.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic)NSArray<Tag*>* tagArray;
@property (nonatomic)NSIndexPath *checkedIndexPath;
@property (nullable, nonatomic, retain) NSOrderedSet<Receipt *> *receipts;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // add yourself as an observer of the notification named
    // NSManagedObjectContextDidSaveNotification
    NSNotificationCenter *notification = [NSNotificationCenter defaultCenter];
    [notification addObserver:self selector:@selector(updateData) name:NSManagedObjectContextDidSaveNotification object:self.managedObjectContext];
    // refetch and call reload tableview
    [self updateData];
}

- (void)updateData {
    self.tagArray = [ViewController fetchingData];
    [self.tableView reloadData];
    
}

#pragma mark - TableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.tagArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tagArray[section].receipts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"receiptCell";
    ReceiptTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    Tag *tag = self.tagArray[indexPath.section];
    Receipt *receipt = tag.receipts[indexPath.row];
    cell.receiptCell.text = receipt.note;
    return cell;

}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    Tag *tag = [self.tagArray objectAtIndex:section];
    return tag.tagName;
}

+ (NSArray *)fetchingData {
    NSManagedObjectContext *context = ((AppDelegate *)[UIApplication sharedApplication].delegate).managedObjectContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Tag"];
    
    //sort an array
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]initWithKey:@"tagName" ascending:YES];
    [request setSortDescriptors:@[sortDescriptor]];
    return [context executeFetchRequest:request error:nil];
}

@end
