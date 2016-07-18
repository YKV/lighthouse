//
//  Movie.m
//  RottenMangoes
//
//  Created by Yevhen Kim on 2016-07-18.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "Movie.h"

@implementation Movie

- (instancetype)initWithTitle:(NSString *)title andYear:(NSNumber *)year andSynopsis:(NSString *)synopsis {
    self = [super init];
    
    if (self) {
        _title = title;
        _year = year;
        _synopsis = synopsis;
        _thumbnail = nil;
        _link = nil;
    }
    return self;
}

- (NSURL *) thumbnailURL {
    return [NSURL URLWithString:self.thumbnail];
}

- (NSURL *) linkURL {
    return [NSURL URLWithString:self.link];
}

@end
