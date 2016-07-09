//
//  GameModel.m
//  TwoPlayerMath
//
//  Created by Yevhen Kim on 2016-07-04.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "GameModel.h"

@implementation GameModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        //instantiate array of questions
        _buttonsArray = [[NSArray alloc]initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9", nil];
        _answer = 0;
    }
    return self;
}

- (NSInteger)generateNumber {
    NSInteger randomNumber = arc4random_uniform(20);
    return randomNumber;
}

- (NSInteger)calculator:(NSInteger)x y:(NSInteger)y {
    self.answer = x + y;
    return self.answer;
}


@end
