//
//  ViewController.m
//  tableViewEx1
//
//  Created by Yevhen Kim on 2016-07-14.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "MasterViewController.h"
#import "SongViewCell.h"
#import "Song.h"

@interface MasterViewController ()

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *songs;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.songs = [[NSMutableArray alloc]init];
    Song *song1 = [[Song alloc]initWithImage:@"taylor_swift.png"
                                       title:@"We Are Never Ever Getting Back Together"
                                      artist:@"Taylor Swift"];
    
    Song *song2 = [[Song alloc]initWithImage:@"justin_bieber.png"
                                       title:@"Baby"
                                      artist:@"Justin Bieber"];
    
    Song *song3 = [[Song alloc]initWithImage:@"ed_sheeran.png"
                                       title:@"Lego House"
                                      artist:@"Ed Sheeran"];
    
    [self.songs addObject:song1];
    [self.songs addObject:song2];
    [self.songs addObject:song3];
}

#pragma mark - Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"showSongDetails"]) {
        NSIndexPath *selectedPath = [self.tableView indexPathForSelectedRow];
        Song *song = self.songs[selectedPath.row];
        DetailViewController *details = (DetailViewController *)[segue destinationViewController];
        [details setSong:song];
    }
}

#pragma mark - Required Table View Methods for Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.songs.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SongViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"songCell" forIndexPath:indexPath];
    Song *song = self.songs[indexPath.row];
    
    cell.image.image = [UIImage imageNamed:song.image ];
    cell.title.text  = song.title;
    cell.artist.text = song.artist;
    
    return cell;
}

@end
