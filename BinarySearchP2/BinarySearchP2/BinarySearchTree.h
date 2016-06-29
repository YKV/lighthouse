//
//  BinaryNodeTree.h
//  BinarySearchP2
//
//  Created by Yevhen Kim on 2016-06-28.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BinaryTreeNode.h"

@interface BinarySearchTree : NSObject

@property (nonatomic, strong) BinaryTreeNode *root;

- (instancetype)initWithObject:(NSObject *)object;
- (void)insertObject:(NSObject *)newObject;
- (BinaryTreeNode *)find:(NSObject *)object;
- (BinaryTreeNode *)deleteObject:(NSObject *)object;

@end
