//
//  DetailViewController.h
//  InstaKilo
//
//  Created by Yevhen Kim on 2016-07-16.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Image;

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageDetailView;
@property (weak, nonatomic) IBOutlet UILabel *categoryDetailView;

@property (strong, nonatomic) Image *image;

@end
