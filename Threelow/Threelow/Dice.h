//
//  Dice.h
//  Threelow
//
//  Created by Yevhen Kim on 2016-06-29.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dice : NSObject

@property (nonatomic) NSInteger currentValue;
@property (nonatomic, strong, readonly) NSString *faceValue;

- (void)rollDice;

@end
