//
//  DetailViewController.h
//  Retest
//
//  Created by Yevhen Kim on 2016-07-18.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Actress;

@interface ActressDetailController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *actressImage;
@property (weak, nonatomic) IBOutlet UILabel *actressName;

@property (strong, nonatomic) Actress *actress;

@end
