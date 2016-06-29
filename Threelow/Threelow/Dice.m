//
//  Dice.m
//  Threelow
//
//  Created by Yevhen Kim on 2016-06-29.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "Dice.h"



@implementation Dice



- (void)spinDice:(NSString*)face {
    
}

- (NSString*)faceString
{
    NSArray<NSString*>* diceFaces = @[@"⚀", @"⚁", @"⚂", @"⚃", @"⚄", @"⚅"];
    uint32_t random = arc4random_uniform([diceFaces count]);
    NSString *randomFace = [diceFaces objectAtIndex:random];
    return randomFace;
}

@end
