//
//  Actress.h
//  Retest
//
//  Created by Yevhen Kim on 2016-07-18.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Actress : NSObject

@property (nonatomic, copy) NSString *actressName;
@property (nonatomic, copy) NSString *imageName;

- (instancetype)initWithImageName:(NSString *)imageName andActressName:(NSString *)actressName;

@end
