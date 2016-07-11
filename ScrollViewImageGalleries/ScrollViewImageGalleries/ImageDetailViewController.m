//
//  ImageDetailViewController.m
//  ScrollViewImageGalleries
//
//  Created by Yevhen Kim on 2016-07-11.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "ImageDetailViewController.h"

@interface ImageDetailViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) UIImageView *imageView;



@end

@implementation ImageDetailViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    
    self.scrollView.delegate = self;
    
    //create content view to hold all additional subviews
//    UIView *contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame))];
    
    //allocate and initialze one imege view
//    UIImageView *oneImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:]];
//    self.imageView = oneImage;
    self.imageView = [[UIImageView alloc]init];
    //give a frame demension to the view
    self.imageView.frame = CGRectZero;
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    //add imageView to scroll view
    [self.scrollView addSubview:self.imageView];

    
    //constraint an image view to all side of scroll view
    [self.imageView.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = YES;
    [self.imageView.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = YES;
    [self.imageView.leftAnchor constraintEqualToAnchor:self.scrollView.leftAnchor].active = YES;
    [self.imageView.rightAnchor constraintEqualToAnchor:self.scrollView.rightAnchor].active = YES;
    
    //specify the content view size
//    self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame));

    self.scrollView.maximumZoomScale = 10;
    self.scrollView.minimumZoomScale = 0.5;
    
    self.imageView.image = self.detailImage;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}
@end
