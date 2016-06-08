//
//  Car.h
//  Cars
//
//  Created by Yevhen Kim on 2016-06-07.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject

@property (strong, nonatomic) NSString *model;

- (void)drive;
- (id)initWithModel:(NSString *)model;

@end
