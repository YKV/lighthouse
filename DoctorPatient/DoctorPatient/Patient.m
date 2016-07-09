//
//  Patient.m
//  DoctorPatient
//
//  Created by Yevhen Kim on 2016-07-02.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "Patient.h"

@implementation Patient

- (id)initWithPatientInfo:(NSString*)name age:(int) age {
    self = [super init];
    if (self) {
        _name = name;
        _age = age;
    }
    return self;
}

- (BOOL)hasName:(NSString *)input {
    if (input) {
        return YES;
    }
    return NO;
}


@end
