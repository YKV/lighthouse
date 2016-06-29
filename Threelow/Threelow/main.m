//
//  main.m
//  Threelow
//
//  Created by Yevhen Kim on 2016-06-29.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"

int main(int argc, const char * argv[]) {
    
    //allocate and initialize every die
    Dice *firstDice = [[Dice alloc]init];
    Dice *secondDice = [[Dice alloc]init];
    Dice *thirdDice = [[Dice alloc]init];
    Dice *fourthDice = [[Dice alloc]init];
    Dice *fifthDice = [[Dice alloc]init];
    
    //get a random face for every die in dies array
    for (Dice *d in @[firstDice, secondDice, thirdDice, fourthDice, fifthDice]) {
        NSLog(@"die: %@", [d faceString]);
    }

    
    
    
    return 0;
}
