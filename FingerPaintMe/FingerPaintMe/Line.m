//
//  Line.m
//  FingerPaintMe
//
//  Created by Yevhen Kim on 2016-07-08.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "Line.h"

@implementation Line

- (instancetype)initWithStart:(CGPoint)start end:(CGPoint)end color:(UIColor*)color {
    self = [super init];
    if (self) {
        _start = start;
        _end = end;
        _currentColor = color;
        
    }
    return self;
}

@end
