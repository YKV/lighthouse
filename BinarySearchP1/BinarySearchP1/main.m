//
//  main.m
//  BinarySearchP1
//
//  Created by Yevhen Kim on 2016-06-28.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    
    
    NSMutableArray *milArray = [[NSMutableArray alloc]init];
    
    for (int i = 0; i <= 1000000; i++) {
        NSNumber *j = [[NSNumber alloc]initWithInt:i];
        [milArray addObject:j];
    }
    NSDate *methodStart = [NSDate date];
    
    // search
    for (int n = 0; n < [milArray count]; n++) {
        if([milArray[n]  isEqual: @1000000]) {
            NSLog(@"Here is %d",n);
        }
        
    }
    
    
    NSDate *methodFinish = [NSDate date];
    NSTimeInterval executionTime = [methodFinish timeIntervalSinceDate:methodStart];
    NSLog(@"executionTime = %f",executionTime);
    
    return 0;
}
