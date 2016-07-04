//
//  Player.m
//  TwoPlayerMath
//
//  Created by Yevhen Kim on 2016-07-04.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)initWithLives:(int)livesPlayer1 player2:(int)livesPlayer2
{
    self = [super init];
    if (self) {
        _livesPlayer1 = 3;
        _livesPlayer2 = 3;
        _currentScore = 0;
    }
    return self;
}

- (NSInteger)loosingLife {
    if (self.livesPlayer1) {
        self.livesPlayer1 -= 1;
    }
    
    else if (self.livesPlayer2) {
        self.livesPlayer2 -= 1;
    }
    return 0;
}


@end
