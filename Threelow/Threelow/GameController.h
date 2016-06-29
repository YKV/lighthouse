//
//  GameController.h
//  Threelow
//
//  Created by Yevhen Kim on 2016-06-29.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"

@interface GameController : NSObject

@property (nonatomic) NSArray *dice;
@property (nonatomic) NSMutableSet *heldDicesCollection;

- (void)holdDiceAtIndex:(NSInteger)index;
- (void)currentScore;
- (void)roll;
- (void)resetDice;

@end
