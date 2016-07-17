//
//  DetailViewController.m
//  InstaKilo
//
//  Created by Yevhen Kim on 2016-07-16.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "DetailViewController.h"
#import "Image.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureImageView];
}

- (void)configureImageView {
        self.imageDetailView.image = [UIImage imageNamed:self.image.imageName];
        self.categoryDetailView.text = self.image.subjectName;
}


@end
