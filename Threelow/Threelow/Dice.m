//
//  Dice.m
//  Threelow
//
//  Created by Yevhen Kim on 2016-06-29.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "Dice.h"



@implementation Dice

//override roll method everytime we initialize the roll
-(instancetype)init {
    self = [super init];
    if (self) {
        [self rollDice];
    }
    
    return self;
}

//roll method
//assigning random number from 1 to 6 to currentValue
- (void)rollDice
{
    self.currentValue = (NSInteger)arc4random_uniform(6) + 1;
  
}

//method on property
//override the property currentValue everytime when randomize every dice
//nobody can set the value to any value since it's readonly

- (NSString *)faceValue {
    
    return @(self.currentValue).stringValue;
}

@end
