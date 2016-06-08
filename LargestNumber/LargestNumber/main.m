//
//  main.m
//  LargestNumber
//
//  Created by Yevhen Kim on 2016-06-08.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    NSArray *numbers = @[@3, @7, @6, @8];
    //NSArray *numbers = @[@44, @5, @6];
    
    NSNumber *max = [numbers valueForKeyPath:@"@max.self"];
    
    NSLog(@"The largest number from numbers array is: %@ ", max);

    
    return 0;
}
