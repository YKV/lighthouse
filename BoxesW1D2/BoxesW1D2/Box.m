//
//  Box.m
//  BoxesW1D2
//
//  Created by Yevhen Kim on 2016-06-28.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "Box.h"

@implementation Box

- (void) initBox:(float)height withWidth:(float)width withLength:(float)length {
    self.height = height;
    self.width = width;
    self.length = length;
}

- (float)volumeCalculate {
    return self.height * self.width * self.length;
}

- (float)fittingBoxesCalculation:(Box *)otherBox {
    float box1Volume = [self volumeCalculate];
    float otherBoxVolume = [otherBox volumeCalculate];
    
    return otherBoxVolume/box1Volume;

}

@end
