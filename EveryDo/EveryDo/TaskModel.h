//
//  TaskModel.h
//  EveryDo
//
//  Created by Yevhen Kim on 2016-07-12.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TaskModel : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, readwrite) NSString *taskDescription;
@property (nonatomic, readwrite) NSNumber *priorityNumber;
@property (nonatomic) BOOL isCompletedIndicator;


- (instancetype)initWithTitle:(NSString*)title description:(NSString*)taskDescription number:(NSNumber*)priorityNumber completed:(BOOL)isCompletedIndicator;

@end
