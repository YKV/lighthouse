//
//  Model.h
//  TestEx2
//
//  Created by Yevhen Kim on 2016-07-14.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Song : NSObject

@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *artist;

-(instancetype)initWithImage:(NSString *)image
                       title:(NSString *)title
                      artist:(NSString *)artist;

+ (NSMutableArray *)populateObjects;

@end
