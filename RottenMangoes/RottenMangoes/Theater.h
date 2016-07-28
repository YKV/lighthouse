//
//  Theater.h
//  RottenMangoes
//
//  Created by Yevhen Kim on 2016-07-19.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@import MapKit;

@interface Theater : NSObject<MKAnnotation>

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *subtitle;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

@end
