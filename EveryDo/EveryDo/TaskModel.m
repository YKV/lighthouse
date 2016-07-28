//
//  TaskModel.m
//  EveryDo
//
//  Created by Yevhen Kim on 2016-07-12.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "TaskModel.h"

@implementation TaskModel

- (instancetype)initWithTitle:(NSString*)title description:(NSString*)taskDescription number:(NSNumber*)priorityNumber completed:(BOOL)isCompletedIndicator {
    self = [super init];
    if (self) {
        self.title = title;
        self.taskDescription = taskDescription;
        self.priorityNumber = priorityNumber;
        self.isCompletedIndicator = NO;
    }
    return self;
}

@end
