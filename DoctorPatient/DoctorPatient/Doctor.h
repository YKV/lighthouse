//
//  Doctor.h
//  DoctorPatient
//
//  Created by Yevhen Kim on 2016-07-02.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Doctor : NSObject

@property NSString *name;
@property NSString *specialization;

- (BOOL)hasName:(NSString *)input;
- (id)initWithDoctorInfo:(NSString *)name specialization:(NSString *)specialization;
- (BOOL)doesPatientVisitDoctor:(NSString *)

@end
