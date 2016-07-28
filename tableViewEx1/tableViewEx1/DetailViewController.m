//
//  DetailViewController.m
//  tableViewEx1
//
//  Created by Yevhen Kim on 2016-07-14.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
}


#pragma mark - Managing post

//setter
- (void)setSong:(Song *)song {
    if (_song != song) {
        _song = song;
        //Update view
        [self configureView];
    }
}

- (void)configureView {
    if (self.song) {
        self.imageDetailView.image = [UIImage imageNamed:self.song.image];
        self.titleDetailView.text  = [self.song title];
        self.artistDetailView.text = [self.song artist];
    }
}


@end
