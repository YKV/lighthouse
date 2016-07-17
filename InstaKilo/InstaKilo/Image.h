//
//  ImageCollection.h
//  InstaKilo
//
//  Created by Yevhen Kim on 2016-07-16.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Image : NSObject

@property (nonatomic, copy)NSString *imageName;
@property (nonatomic, copy)NSString *subjectName;
@property (nonatomic, copy)NSString *locationName;

- (instancetype)initWithImage:(NSString *)imageName
                   andSubject:(NSString *)subjectName
                  andLocation:(NSString *)locationName;


@end
