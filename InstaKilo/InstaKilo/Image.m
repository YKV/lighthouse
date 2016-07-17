//
//  ImageCollection.m
//  InstaKilo
//
//  Created by Yevhen Kim on 2016-07-16.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "Image.h"

@implementation Image

- (instancetype)initWithImage:(NSString *)imageName
                   andSubject:(NSString *)subjectName
                  andLocation:(NSString *)locationName {
    
    self = [super init];
    if (self) {
        _imageName    = imageName;
        _subjectName  = subjectName;
        _locationName = locationName;
    }
    
    return self;
}
@end
