//
//  Line.m
//  FingerPaintMe
//
//  Created by Yevhen Kim on 2016-07-08.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "Line.h"

@implementation Line

- (instancetype)initWithStart:(CGPoint)startPoint end:(CGPoint)endPoint {
    self = [super init];
    if (self) {
        _startPoint = &startPoint;
        _endPoint = &endPoint;
    }
    return self;
}

@end
