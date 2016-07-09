//
//  main.m
//  DoctorPatient
//
//  Created by Yevhen Kim on 2016-07-02.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Doctor.h"
#import "Patient.h"
#import "InputCollector.h"

int main(int argc, const char * argv[]) {
    
    Patient *patient = [[Patient alloc]init];
    
    NSString *prompt = @"\nDo you have a healthcard:(y/n)";
    InputCollector *input = [[InputCollector alloc]init];
    
    NSString *patientInput = [input inputForPrompt: prompt];
    
    return 0;
}
