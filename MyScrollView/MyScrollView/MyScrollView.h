//
//  MyScrollView.h
//  MyScrollView
//
//  Created by Yevhen Kim on 2016-07-11.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyScrollView : UIView<UIGestureRecognizerDelegate>

@property (nonatomic) CGSize contentSize;
@property (nonatomic, strong) UIPanGestureRecognizer *panGesture;

- (void)preparePanGestureRecognizer;

@end
