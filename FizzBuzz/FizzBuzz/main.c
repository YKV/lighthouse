//
//  main.c
//  FizzBuzz
//
//  Created by Yevhen Kim on 2016-06-06.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    int i = 1;
    //loop through 1 to 100
    while(i < 100) {
     
        //if i module 3 and 5 equals 0 print FizzBuzz
        if((i%3) == 0 && (i%5) == 0) {
            printf("FizzBuzz\n");
        }
        //if i module 3 equals 0 then print Fizz
        if(i%3==0) {
            printf("Fizz\n");
        }
        //else if i module 5 equals 0 then print Buzz
        else if(i%5==0) {
            printf("Buzz\n");
        }
        //if none then print the number
        else {
            printf("Number: %d\n", i);
        }
        i += 1;
    }
    return 0;
}
