//
//  GameController.m
//  Threelow
//
//  Created by Yevhen Kim on 2016-06-29.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "GameController.h"

@implementation GameController

- (instancetype)init {
    self = [super init];
    if(self) {
        //override dice array once you start the game
        _dice = @[[[Dice alloc]init], [[Dice alloc]init],
                  [[Dice alloc]init], [[Dice alloc]init], [[Dice alloc]init]];
        _heldDicesCollection = [[NSMutableSet alloc]init];
        
        
    }
    return self;
}

- (void)roll {
    //check if dices held
    for (Dice *d in self.dice) {
        
        if([self.heldDicesCollection containsObject:d]) {
            continue;
        }
        //otherwise roll
        [d rollDice];
        
    }
    [self currentScore];
    
}

- (void)currentScore {
    // log out the current score to user
    //loop thru each dice in dices
    NSInteger score = 0;
    for (Dice *d in self.dice) {
        
        BOOL held = [self.heldDicesCollection containsObject:d];
        NSString *display = d.faceValue;
        if (held) {
            display = [NSString stringWithFormat:@"[%@]", d.faceValue];
        }
        score += d.currentValue;
        NSLog(@"Face value is %@",display);
    }
    //show faceValue and currentScore
    NSLog(@"current score is %ld", score);
    
}

- (void)holdDiceAtIndex:(NSInteger)index {
    //get dice at index and check if its in a held set
    Dice *obj = [self.dice objectAtIndex:index];
    if ([self.heldDicesCollection containsObject:obj]) {
        //if it's in a set remove it
        [self.heldDicesCollection removeObject:obj];
        NSLog(@"Dice %@ has been removed", obj.faceValue);
    }
    else {
        //otherwise add it
        [self.heldDicesCollection addObject:obj];
        NSLog(@"Dice %@ has been added", obj.faceValue);
    }
}

- (void)resetDice {
    [self.heldDicesCollection removeAllObjects];

}

@end
