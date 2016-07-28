//
//  DetailViewController.m
//  Retest
//
//  Created by Yevhen Kim on 2016-07-18.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "ActressDetailController.h"
#import "Actress.h"

@interface ActressDetailController ()

@end

@implementation ActressDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureActressView];
}

- (void)configureActressView {
    self.actressName.text = self.actress.actressName;
    self.actressImage.image = [UIImage imageNamed:self.actress.imageName];
}



@end
