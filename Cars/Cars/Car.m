//
//  Car.m
//  Cars
//
//  Created by Yevhen Kim on 2016-06-07.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "Car.h"

@implementation Car

- (void)drive {
    NSLog(@"Driving a %@", self.model);
}

- (id)initWithModel:(NSString *)model {
    self = [super init];
    if(self) {
        _model = model;
    }
    return self;
}

@end
