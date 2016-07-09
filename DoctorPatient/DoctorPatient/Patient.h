//
//  Patient.h
//  DoctorPatient
//
//  Created by Yevhen Kim on 2016-07-02.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Patient : NSObject

@property int age;
@property NSString *name;
@property (nonatomic, weak) NSString *doctor;

- (BOOL)hasName:(NSString *)input ;
- (id)initWithPatientInfo:(NSString*)name age:(int) age;

@end
