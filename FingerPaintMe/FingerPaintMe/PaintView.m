//
//  Paint.m
//  FingerPaintMe
//
//  Created by Yevhen Kim on 2016-07-08.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "PaintView.h"
#import "Line.h"

@interface PaintView()

@property (nonatomic, strong) NSMutableArray *lines;

@end

@implementation PaintView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _lines = [NSMutableArray array];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

#pragma mark - Touches handlers

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //touch at any object
    UITouch *touch = touches.anyObject;
    //set start and end location of touches
    CGPoint start = [touch previousLocationInView:self];
    CGPoint end = [touch locationInView:self];
    //allocate and initialize instance of Line and add it to lines mutable array
    Line *line = [[Line alloc]initWithStart:start end:end];
    [self.lines addObject:line];
    //set self to display on view
    [self setNeedsDisplay];
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}
@end
