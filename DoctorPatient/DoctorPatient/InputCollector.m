//
//  InputCollection.m
//  DoctorPatient
//
//  Created by Yevhen Kim on 2016-07-02.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "InputCollector.h"

@implementation InputCollector

- (NSString *)inputForPrompt:(NSString *)promptString {
    char answer[255];
    NSLog(@"%@",promptString);
    
    //read the answer
    fgets(answer, 255, stdin);
    
    //convert to NSString
    NSString *newString = [NSString stringWithUTF8String:answer];
    
    //remove \n before returning
    newString = [newString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    return newString;
}

@end
