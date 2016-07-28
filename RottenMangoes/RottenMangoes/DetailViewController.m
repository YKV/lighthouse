//
//  DetailViewController.m
//  RottenMangoes
//
//  Created by Yevhen Kim on 2016-07-18.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "DetailViewController.h"
#import "Movie.h"
#import "WebViewController.h"
#import "MapViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)configureView {

    self.synopsisView.text = self.movie.synopsis;
    NSData *imageData = [NSData dataWithContentsOfURL:self.movie.thumbnailURL];
    self.imageView.image = [UIImage imageWithData:imageData];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showInBrowser"]) {
        WebViewController *webController = (WebViewController *)[segue destinationViewController];
        webController.movieURL = [NSURL URLWithString:self.movie.link];
    }
    else if ([segue.identifier isEqualToString:@"showTheatersOnMap"]) {
        MapViewController *mapController = (MapViewController *)[segue destinationViewController];
        mapController.movie = self.movie;
    }
}



@end
