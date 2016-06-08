//
//  main.m
//  Cars
//
//  Created by Yevhen Kim on 2016-06-07.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"
#import "Toyota.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Car *nissan = [[Car alloc]initWithModel:@"Rogue"];
        Toyota *toyota = [[Toyota alloc]init];
        
        [nissan drive];
        [toyota drive];
    }
    
    return 0;
}
