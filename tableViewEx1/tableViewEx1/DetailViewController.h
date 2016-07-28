//
//  DetailViewController.h
//  tableViewEx1
//
//  Created by Yevhen Kim on 2016-07-14.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Song.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Song *song;
@property (weak, nonatomic) IBOutlet UIImageView *imageDetailView;
@property (weak, nonatomic) IBOutlet UILabel *artistDetailView;
@property (weak, nonatomic) IBOutlet UILabel *titleDetailView;


@end
