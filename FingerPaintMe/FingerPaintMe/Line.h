//
//  Line.h
//  FingerPaintMe
//
//  Created by Yevhen Kim on 2016-07-08.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Line : NSObject

@property CGPoint *startPoint;
@property CGPoint *endPoint;

- (instancetype)initWithStart:(CGPoint)startPoint end:(CGPoint)endPoint;

@end
