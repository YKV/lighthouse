//
//  DetailViewController.h
//  ToEveryDo
//
//  Created by Yevhen Kim on 2016-07-20.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

