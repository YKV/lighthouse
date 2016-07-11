//
//  ViewController.m
//  ScrollViewImageGalleries
//
//  Created by Yevhen Kim on 2016-07-11.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "ViewController.h"
#import "ImageDetailViewController.h"

@interface ViewController () <UIScrollViewDelegate, UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageController;

@property (strong, nonatomic) UIImageView *firstView;
@property (strong, nonatomic) UIImageView *secondView;
@property (strong, nonatomic) UIImageView *thirdView;

@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;
@property (nonatomic, strong) NSArray *views;

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.scrollView.delegate = self;
    
    self.pageController.numberOfPages = 3;
    self.pageController.currentPage = 0;
    self.pageController.backgroundColor = [UIColor greenColor];
    
    //create content view to hold all additional subviews
    UIView *contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame))];
    
    //allocate and initialize three views and assign them to properties
    UIImageView *firstImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Lighthouse-in-Field"]];
    self.firstView = firstImageView;
    UIImageView *secondImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Lighthouse-night"]];
    self.secondView = secondImageView;
    UIImageView *thirdImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Lighthouse-zoomed"]];
    self.thirdView = thirdImageView;
    
    //add subviews to the array
    self.views = @[self.firstView, self.secondView, self.thirdView];

    //flag for X end point to every subview
    CGFloat xOffset = 0;
    
    //loop through an array of views and place them in content view beside each other
    for (UIImageView *imageView in self.views) {
        imageView.frame = CGRectMake(xOffset, 0, CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame));
        [contentView addSubview:imageView];
        xOffset += CGRectGetWidth(imageView.frame);
        
    }

    //specify the content view size
    self.scrollView.contentSize = CGSizeMake(xOffset, CGRectGetHeight(self.scrollView.frame));
    
    [self.scrollView addSubview:contentView];
    
    //enable pagining
    self.scrollView.pagingEnabled = YES;
    
    //tap gesture recognizer
    self.tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped:)];
    //here I actually want to tap every picture and go to image details view
    [self.scrollView addGestureRecognizer:self.tapGesture];
    

    
}

#pragma mark - Gesture recognizer handlers
- (void)tapped:(UITapGestureRecognizer*)tap {
    CGFloat rolX = self.scrollView.contentOffset.x;
    int pageNumber = rolX / CGRectGetWidth(self.scrollView.frame);
    
    if (pageNumber == 0) {
        [self performSegueWithIdentifier:@"showDetails" sender:self.views[0]];
    }
    else if (pageNumber == 1) {
        [self performSegueWithIdentifier:@"showDetails" sender:self.views[1]];
    }
    else if (pageNumber == 2) {
        [self performSegueWithIdentifier:@"showDetails" sender:self.views[2]];
    }
    
    //NSLog(@"Tapped: %d", pageNumber);

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"showDetails"]) {
        ImageDetailViewController *details = (ImageDetailViewController *)segue.destinationViewController;
        details.detailImage = ((UIImageView*)sender).image;
                
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat rolX = self.scrollView.contentOffset.x;
    int pageNumber = rolX / CGRectGetWidth(self.scrollView.frame);
    self.pageController.currentPage = pageNumber;
}

@end
