//
//  Model.m
//  TestEx2
//
//  Created by Yevhen Kim on 2016-07-14.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "Song.h"

@implementation Song

-(instancetype)initWithImage:(NSString *)image
                       title:(NSString *)title
                     summary:(NSString *)summary {
    
    self = [super init];
    if (self) {
        _image = image;
        _title = title;
        _summary = summary;
    }
    
    return self;
}

+ (NSMutableArray *)populateObjects {
    NSMutableArray *objects = [[NSMutableArray alloc]init];
    NSArray *objImage = @[@"tux.png",@"mrx.png"];
    NSArray *objTitle= @[@"tux", @"mrx"];
    NSArray *objSummary = @[@"blah", @"blah"];
    for (int i = 0; i < 2; i++) {
        Song *object = [[Song alloc]initWithImage:objImage[i] title:objTitle[i] summary:objSummary[i]];
        [objects addObject:object];
    }
    return objects;
}


@end
