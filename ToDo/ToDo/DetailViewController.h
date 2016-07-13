//
//  DetailViewController.h
//  ToDo
//
//  Created by Yevhen Kim on 2016-07-12.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskModel.h"


@interface DetailViewController : UIViewController

@property (strong, nonatomic) TaskModel* detailItem;


//@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
