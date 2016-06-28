//
//  main.m
//  BoxesW1D2
//
//  Created by Yevhen Kim on 2016-06-28.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Box.h"

int main(int argc, const char * argv[]) {
    
    Box *box1 = [[Box alloc]init];
    box1.width = 20;
    box1.height = 20.5;
    box1.length = 21;
    
    float volume = [box1 volumeCalculate];
    NSLog(@"The volume of box is %f", volume);
    
    Box *box2 = [[Box alloc]init];
    box2.width = 30;
    box2.height = 15;
    box2.length = 13.5;
    
    float volume2 = [box2 volumeCalculate];
    NSLog(@"The other box volume is %f", volume2);
    
    float fits;
    
    if( volume2 > volume) {
        fits = [box2 fittingBoxesCalculation: box1];
        NSLog(@"Box1 fits into box2 %f times", volume2/volume);
        
    }
    else {
        fits = [box1 fittingBoxesCalculation: box2];
        NSLog(@"Box2 fits into box1 %f times", volume/volume2);
    }
    
    return 0;
}
