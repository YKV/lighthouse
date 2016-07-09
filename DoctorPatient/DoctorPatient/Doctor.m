//
//  Doctor.m
//  DoctorPatient
//
//  Created by Yevhen Kim on 2016-07-02.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "Doctor.h"

@implementation Doctor

- (id)initWithDoctorInfo:(NSString *)name specialization:(NSString *)specialization {
    self = [super init];
    if (self) {
        _name = name;
        _specialization = specialization;
    }
    return self;
}

//check if Doctor has name by user input
- (BOOL)hasName:(NSString *)input {
    if (input) {
        return YES;
    }
    return NO;
}

@end
