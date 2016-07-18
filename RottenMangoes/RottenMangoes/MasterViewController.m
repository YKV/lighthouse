//
//  MasterViewController.m
//  RottenMangoes
//
//  Created by Yevhen Kim on 2016-07-18.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Movie.h"
#import "CustomTableViewCell.h"


@interface MasterViewController ()


@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
//    self.navigationItem.rightBarButtonItem = addButton;
//    
    //create an instance of url
    NSURL *moviesURL = [NSURL URLWithString:@"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=55gey28y6ygcr8fjy4ty87ek&page_limit=50"];
    //get the data from from url in json format
    NSData *jsonData = [NSData dataWithContentsOfURL:moviesURL];
    
    //assign error handler to nil
    NSError *error = nil;
    
    //get the disctionary data after serialization of json
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    
    //NSLog(@"%@",dataDictionary);
    
    //initialize and allocate our mutable array
    self.movies = [NSMutableArray array];
    
    //create an array for key movies
    NSArray *moviesArray = [dataDictionary objectForKey:@"movies"];
    
    //loop through movies array
    for (NSDictionary *movieDictionary in moviesArray) {
        Movie *movie = [[Movie alloc]initWithTitle:[movieDictionary objectForKey:@"title"] andYear:[movieDictionary objectForKey:@"year"] andSynopsis:[movieDictionary objectForKey:@"synopsis"]];
        //since thumbnail in posters dictionary let's get it from that dictionary
        movie.thumbnail = movieDictionary[@"posters"][@"thumbnail"];
        movie.link = movieDictionary[@"links"][@"alternate"];
        
        //add the movie object to movies
        [self.movies addObject:movie];
    }
    
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Movie *movie = self.movies[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        controller.movie = movie;
    }
    
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    //getting the entire row of data for one movie
    Movie *movie = [self.movies objectAtIndex:indexPath.row];
    
    //check if the thumbnail is kind of NSString class in json file
    //if yes then get the data from thumbnail
    if ([movie.thumbnail isKindOfClass:[NSString class]]) {
        NSData *imageData = [NSData dataWithContentsOfURL:movie.thumbnailURL];
        UIImage *image = [UIImage imageWithData:imageData];
        cell.imageView.image = image;
    }
    else {
        //if there is no image then use this default image
        cell.imageView.image = [UIImage imageNamed:@"cs.png"];
    }
    
    //now to cell labels and image view data of image
    cell.movieTitleLabel.text = movie.title;
    cell.movieYearLabel.text = movie.year.stringValue;
    
    return cell;
    
}




- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.movies removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

@end
