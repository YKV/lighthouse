//
//  SecondViewController.h
//  test
//
//  Created by Yevhen Kim on 2016-07-13.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SecondDelegate <NSObject>

- (void)didTyped:(NSString *)string;

@end

@interface SecondViewController : UIViewController

@property (nonatomic, weak) id<SecondDelegate> delegate;

@end
