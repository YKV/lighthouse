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
    
    printf("Welcome to personal survey");
    printf("Would you like to start survey?(y/n):");
    fgets(start, 1, stdin);
    while(start) {
        printf("Input a string: ");
        fgets(inputsChars, 255, stdin);
        printf("Your string is %s\n", inputsChars);
        NSString *inputString = [NSString stringWithUTF8String:inputsChars];
        
        //switch to Upper case
        NSString *upperCaseString = [inputString uppercaseString];
        NSLog(@"And the uppercase tring is: %@", upperCaseString);
        
        //switch to lower case
        NSString *lowerCaseString = [inputString lowercaseString];
        NSLog(@"And the lowercase tring is: %@", lowerCaseString);
        
        //check if input string can be converted to number
        if([inputString intValue]) {
            NSLog(@"So the number is: %@", inputString);
        }
        
        //concatination
        NSString *canadianizeString = [inputString stringByAppendingString:@", eh?"];
        NSLog(@"%@",canadianizeString);
        
        //replace white spaces with dashes
        NSString *newString = [inputString stringByReplacingOccurrencesOfString:@"[!?., ]+" withString:@"-" options: NSRegularExpressionSearch range:NSMakeRange(0, inputString.length)];
        NSLog(@"%@",newString);
        
        //check if the input string ends with ? or !
        
        if ([inputString hasSuffix:@"?"]) {
            NSLog(@"I don't know");
        }
        else if ([inputString hasSuffix:@"!"]) {
            NSLog(@"Whoa, calm down!");
        }
        
    }
    
    return 0;
}
