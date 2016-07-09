//
//  PaintView.m
//  FingerPaintMe
//
//  Created by Yevhen Kim on 2016-07-08.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "PaintView.h"
#import "Line.h"

@interface PaintView()
@property (nonatomic, strong) NSMutableArray *lines;
@property (nonatomic) UIBezierPath *path;


@end
@implementation PaintView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _lines = [NSMutableArray array];
        _path = [[UIBezierPath alloc]init];
        _lineColor = [UIColor greenColor];

    }
    return self;

}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    

    for (Line *line in self.lines) {
        
        UIBezierPath *linePath = [[UIBezierPath alloc]init];
        
        linePath.lineWidth = 10.0;
        linePath.lineCapStyle = kCGLineCapRound;
        
        [linePath moveToPoint:line.start];
        [linePath addLineToPoint:line.end];
        
        [line.currentColor set];
        
        [linePath stroke];
        
    }
    //[self.path stroke];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //touch any object on view
    UITouch *touch = touches.anyObject;
    //set start and end points of touches
    CGPoint start = [touch previousLocationInView:self];
    CGPoint end = [touch locationInView:self];
    //allocate and initialize line
    Line *line = [[Line alloc]initWithStart:start end:end color:self.lineColor];
    //add line to the lines array and display it
    [self.lines addObject:line];
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //touch any object on view
    UITouch *touch = touches.anyObject;
    //set start and end points of touches
    CGPoint start = [touch previousLocationInView:self];
    CGPoint end = [touch locationInView:self];
    //allocate and initialize line
    Line *line = [[Line alloc]initWithStart:start end:end color:self.lineColor];
    //add line to the lines array and display it
    [self.lines addObject:line];
    [self setNeedsDisplay];
}

@end
