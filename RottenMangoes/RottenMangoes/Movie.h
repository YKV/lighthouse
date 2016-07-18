//
//  Movie.h
//  RottenMangoes
//
//  Created by Yevhen Kim on 2016-07-18.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSNumber *year;
@property (nonatomic, strong) NSString *synopsis;
@property (nonatomic, strong) NSString *thumbnail;
@property (nonatomic, strong) NSString *link;

- (instancetype)initWithTitle:(NSString *)title andYear:(NSNumber *)year andSynopsis:(NSString *)synopsis;

- (NSURL *) thumbnailURL;
- (NSURL *) linkURL;

@end
