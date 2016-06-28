//
//  Box.h
//  BoxesW1D2
//
//  Created by Yevhen Kim on 2016-06-28.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Box : NSObject

@property float height;
@property float width;
@property float length;

- (void)initBox:(float)height withWidth:(float)width withLength:(float)length;
- (float)volumeCalculate;
- (float)fittingBoxesCalculation:(Box *)otherBox;

@end
