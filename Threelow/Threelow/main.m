//
//  main.m
//  Threelow
//
//  Created by Yevhen Kim on 2016-06-29.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "InputCollector.h"

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

    //prompt the instruction to the user and ask for input
    NSString *prompt = @"Please type roll if you want to roll dices, type quit if you want to quit the game: ";
    
    //create an instance of InputCollector class
    InputCollector *input = [[InputCollector alloc]init];
    
    //safe whatever user typed to variable userInput
    NSString *userInput = [input inputForPrompt:prompt];
    
    //ask for the input till user type quit word
    while (![userInput isEqualToString:@"quit"]) {
        //if user typed roll randomize all dices again
        if ([userInput isEqualToString:@"roll"]) {
            //get a random face for every die in dies array
            for (Dice *d in @[firstDice, secondDice, thirdDice, fourthDice, fifthDice]) {
                NSLog(@"die: %@", [d faceString]);
            }
        }
        
        userInput = [input inputForPrompt:prompt];
    }
    
    
    return 0;
}
