//
//  MyScrollView.m
//  MyScrollView
//
//  Created by Yevhen Kim on 2016-07-11.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "MyScrollView.h"

@implementation MyScrollView

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self preparePanGestureRecognizer];
    }
    return self;
}

- (void)preparePanGestureRecognizer {
    self.panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panned:)];
    [self addGestureRecognizer:self.panGesture];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)panned:(UIPanGestureRecognizer *)recognizer {
    //CGPoint location = [recognizer locationInView:self];
    CGPoint translation = [recognizer translationInView:self];
    CGRect imagePosition = self.bounds;
    if (recognizer.state == UIGestureRecognizerStateChanged) {
        

        CGFloat newImagePositionX = imagePosition.origin.x - translation.x;
        CGFloat minImagePositionOriginX = 0.0;
        CGFloat maxImagePositionOriginX = self.contentSize.height - imagePosition.size.width;
        CGFloat newX = fmax(minImagePositionOriginX, fmin(newImagePositionX, maxImagePositionOriginX));
        
        
        CGFloat newImagePositionY = imagePosition.origin.y - translation.y;
        CGFloat minImagePositionOriginY = 0.0;
        CGFloat maxImagePositionOriginY = self.contentSize.height - imagePosition.size.height;
        CGFloat newY = fmax(minImagePositionOriginY, fmin(newImagePositionY, maxImagePositionOriginY));
        
        imagePosition.origin = CGPointMake(newX, newY);
        
        self.bounds = imagePosition;
        [recognizer setTranslation:CGPointZero inView:self];
    }
    
}

@end
