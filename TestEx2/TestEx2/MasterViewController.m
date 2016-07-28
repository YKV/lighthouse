//
//  ViewController.m
//  TestEx2
//
//  Created by Yevhen Kim on 2016-07-14.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "MasterViewController.h"
#import "Song.h"
#import "TableViewCell.h"


@interface MasterViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *data;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Song 
    
    self.data = [Model populateObjects];
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showDetails"]) {
        NSIndexPath *selectedPath = [self.tableView indexPathForSelectedRow];
        Song *cellData = self.data[selectedPath.row];
        DetailViewController *details = (DetailViewController *)[segue destinationViewController];
        [details setDetailItem:cellData];
    }
}

#pragma mark - Required Table View Methods for Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    Song *cellData = self.data[indexPath.row];
    
    cell.cellImage.image = [UIImage imageNamed:cellData.image ];
    cell.cellTitle.text = cellData.title;
    cell.cellSummary.text = cellData.summary;
    
    return cell;
}

@end
