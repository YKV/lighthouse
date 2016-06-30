//
//  BinaryTreeNode.m
//  BinarySearchP2
//
//  Created by Yevhen Kim on 2016-06-28.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "BinaryTreeNode.h"

@implementation BinaryTreeNode

- (BOOL)isLeftChildParent {
    if([self.parent.leftChild isEqual:self]) {
        return YES;
    }
    else {
        return NO;
    }
 }

@end
