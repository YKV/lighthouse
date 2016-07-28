//
//  Actress.m
//  Retest
//
//  Created by Yevhen Kim on 2016-07-18.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "Actress.h"

@implementation Actress

- (instancetype)initWithImageName:(NSString *)imageName
                   andActressName:(NSString *)actressName {
    
    self = [super init];
    if (self) {
        _imageName   = imageName;
        _actressName = actressName;
    }
    return self;
}

@end
