//
//  Player.h
//  TwoPlayerMath
//
//  Created by Yevhen Kim on 2016-07-04.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic, strong, readwrite) NSMutableArray *livesPlayer1;
@property (nonatomic, strong, readwrite) NSMutableArray *livesPlayer2;
@property (nonatomic, assign) NSInteger currentScore;


- (NSInteger)loosingLife;
- (NSInteger)randomPlayer;


@end
