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
#import "GameController.h"

int main(int argc, const char * argv[]) {
    
    //allocate and initialize every gameController
    GameController *gameController = [[GameController alloc]init];

    //prompt the instruction to the user and ask for input
    NSString *prompt = @"\nPlease type roll if you want to roll dices, \ntype quit if you want to quit the game \ntype reset to reset held collection: ";
    
    //create an instance of InputCollector class
    InputCollector *input = [[InputCollector alloc]init];
    
    //safe whatever user typed to variable userInput
    NSString *userInput = [input inputForPrompt:prompt];
    
    //ask for the input till user type quit word
    while (![userInput isEqualToString:@"quit"]) {
        //if user typed roll randomize all dices again
        if ([userInput isEqualToString:@"roll"]) {
            [gameController roll];
             NSString *value = [input inputForPrompt: @"Please enter the dice index: "];
            int index = [value intValue];
            [gameController holdDiceAtIndex:index];

        }
        else if([userInput isEqualToString:@"reset"]) {
            [gameController resetDice];
        }
        
        userInput = [input inputForPrompt:prompt];
    }

    return 0;
}
