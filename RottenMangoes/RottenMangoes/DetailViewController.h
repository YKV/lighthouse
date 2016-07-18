//
//  DetailViewController.h
//  RottenMangoes
//
//  Created by Yevhen Kim on 2016-07-18.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Movie;

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Movie *movie;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *synopsisView;

@property (weak, nonatomic) IBOutlet UIButton *linkButton;

@end

