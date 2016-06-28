//
//  main.m
//  Variables
//
//  Created by Yevhen Kim on 2016-06-27.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    char inputsChars[255];
    char start[1];
    int answer;
    
    printf("Welcome to Choice game");
    //printf("Would you like to start survey?(y/n):");
    //fgets(start, 1, stdin);
    //while(start) {
    while(true) {
        printf("\nInput a string: ");
        fgets(inputsChars, 255, stdin);
        //printf("Your string is %s\n", inputsChars);
        NSString *inputString = [NSString stringWithUTF8String:inputsChars];
        
        
        printf("Now enter a number from the following selections to perform the desired action:\n1:Upper \n2:Lower \n3:Number \n4:concatination \n5:replace space \n6:get an answer \n");
        
        scanf("%d",&answer);
        
        switch (answer) {
            case 1:
            {
                //switch to Upper case
                NSString *upperCaseString = [inputString uppercaseString];
                NSLog(@"And the uppercase tring is: %@",upperCaseString);
                break;
            }
            case 2:
            {
                //switch to lower case
                NSString *lowerCaseString = [inputString lowercaseString];
                NSLog(@"And the lowercase tring is: %@",lowerCaseString);
                break;
            }
            case 3:
            {
                //check if input string can be converted to number
                if([inputString intValue]) {
                    NSLog(@"So the number is: %@", inputString);
                }
                else {
                    NSLog(@"Not a number!");
                }
                break;
            }
            case 4:
            {
                //concatination
                NSString *canadianizeString = [inputString stringByAppendingString:@", eh?"];
                NSLog(@"%@",canadianizeString);
                break;
            }
            case 5:
            {
                //replace white spaces with dashes
                NSString *newString = [inputString stringByReplacingOccurrencesOfString:@"[!?., ]+" withString:@"-" options: NSRegularExpressionSearch range:NSMakeRange(0, inputString.length)];
                NSLog(@"%@",newString);
                break;
            }
            case 6:
                //check if the input string ends with ? or !
                
                if ([inputString hasSuffix:@"?"]) {
                    NSLog(@"I don't know");
                }
                else if ([inputString hasSuffix:@"!"]) {
                    NSLog(@"Whoa, calm down!");
                }
                break;
        }
        
    }
    
    return 0;
}
