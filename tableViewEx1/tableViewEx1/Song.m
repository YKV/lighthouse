//
//  PostModel.m
//  tableViewEx1
//
//  Created by Yevhen Kim on 2016-07-14.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "Song.h"

@implementation Song

- (instancetype)initWithImage:(NSString*)image
                        title:(NSString*)title
                       artist:(NSString*)artist {
    
    self = [super init];
    if (self) {
        _image  = image;
        _title  = title;
        _artist = artist;
    }
    return self;
}

@end
