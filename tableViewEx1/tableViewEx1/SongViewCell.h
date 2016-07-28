//
//  PostViewCell.h
//  tableViewEx1
//
//  Created by Yevhen Kim on 2016-07-14.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SongViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *artist;
@property (weak, nonatomic) IBOutlet UILabel *title;


@end
