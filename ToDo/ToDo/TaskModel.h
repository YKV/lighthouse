//
//  TaskModel.h
//  ToDo
//
//  Created by Yevhen Kim on 2016-07-12.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TaskModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *taskDescription;
@property (nonatomic, copy) NSString *priority;
@property BOOL isCompletedIndicator;


- (instancetype)initWithTitle:(NSString*)title description:(NSString*)taskDescription number:(NSString*)priority completed:(BOOL)isCompletedIndicator;

@end
