//
//  GameModel.h
//  TwoPlayerMath
//
//  Created by Yevhen Kim on 2016-07-04.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameModel : NSObject

//@property (nonatomic, strong) NSArray *arrayOfQuestions;
//@property (nonatomic, strong) NSArray *arrayOfAnswers;
//@property (nonatomic, assign) NSInteger currentPlayer1QuestionIndex;
//@property (nonatomic, assign) NSInteger currentPlayer2QuestionIndex;

@property (nonatomic, strong) NSArray *buttonsArray;
@property (nonatomic, assign) NSInteger answer;


- (NSInteger)generateNumber;
- (NSInteger)calculator:(NSInteger)x y:(NSInteger)y;


@end
