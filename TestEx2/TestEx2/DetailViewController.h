//
//  DetailViewController.h
//  TestEx2
//
//  Created by Yevhen Kim on 2016-07-14.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Song;

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Song* detailItem;
@property (weak, nonatomic) IBOutlet UIImageView *detailImage;

@property (weak, nonatomic) IBOutlet UILabel *detailTitle;
@property (weak, nonatomic) IBOutlet UILabel *detailSummary;

@end
