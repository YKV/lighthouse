//
//  ViewController.m
//  tableViewEx1
//
//  Created by Yevhen Kim on 2016-07-14.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "MasterViewController.h"
#import "PostViewCell.h"
#import "Song.h"

@interface MasterViewController ()

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *posts;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.posts = [[NSMutableArray alloc]init];
    Song *post1 = [[Song alloc]initWithImage:@"Adium.png" title:@"New Adium" description:@"We launched a new Adium"];
    Song *post2 = [[Song alloc]initWithImage:@"grunt.png" title:@"Grunt" description:@"Grunt is getting bigger"];
    Song *post3 = [[Song alloc]initWithImage:@"luigi.png" title:@"Luigi" description:@"Mario is my bro"];
    Song *post4 = [[Song alloc]initWithImage:@"Mario.png" title:@"Mario" description:@"Luigi is my bro"];
    Song *post5 = [[Song alloc]initWithImage:@"tux.png" title:@"Linux" description:@"Everyone should use linux"];
    
    [self.posts addObject:post1];
    [self.posts addObject:post2];
    [self.posts addObject:post3];
    [self.posts addObject:post4];
    [self.posts addObject:post5];
    
    [self.tableView reloadData];
}

#pragma mark - Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showDetails"]) {
        NSIndexPath *selectedPath = [self.tableView indexPathForSelectedRow];
        Song *post = self.posts[selectedPath.row];
        DetailViewController *details = (DetailViewController *)[segue destinationViewController];
        [details setPost:post];
    }
}

#pragma mark - Required Table View Methods for Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.posts.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PostViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"postCell" forIndexPath:indexPath];
    Song *post = self.posts[indexPath.row];
    
    cell.postImage.image = [UIImage imageNamed:post.postImage ];
    cell.postTitle.text = post.postTitle;
    cell.postDescription.text = post.postDescription;
    
    return cell;
}

@end
