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
        _arrayOfQuestions = [[NSArray alloc]initWithObjects:
                             @"4 * 4 = ?",
                             @"5 + 6 = ?",
                             @"5 * 5 = ?",
                             @"12 * 12 = ?",
                             @"7 * 5 = ?",
                             @"8 * 8 = ?",
                             @"13 * 13 = ?",
                             @"11 * 11 = ?"
                             @"(12 + 5) * 3 = ?"
                             @"22 * 3 = ?",nil];
        _arrayOfAnswers = [[NSArray alloc]initWithObjects:
                            @16, @11, @25, @144, @35, @64, @169, @121, @51, @66, nil];
    }
    return self;
}

- (NSString *)generateQuestion {
    int random = arc4random_uniform((int)self.arrayOfQuestions.count);
    return [self.arrayOfQuestions objectAtIndex:random];
}




@end
