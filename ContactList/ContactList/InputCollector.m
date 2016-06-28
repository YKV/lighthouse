//
//  InputCollector.m
//  ContactList
//
//  Created by Yevhen Kim on 2016-06-28.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "InputCollector.h"

@implementation InputCollector

- (NSString *)inputForPrompt:(NSString *)promptString {
    char answer[255];
    NSLog(@"%@", promptString);
    
    
    //read the answer
    fgets(answer, 255, stdin);
    
    //convert to objective C NSString object
    NSString *newString = [NSString stringWithUTF8String:answer];
    
    // remove \n from newString before returing
    newString = [newString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return newString;
}

@end
