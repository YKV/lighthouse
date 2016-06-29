//
//  BinaryNodeTree.m
//  BinarySearchP2
//
//  Created by Yevhen Kim on 2016-06-28.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "BinarySearchTree.h"

@implementation BinarySearchTree

- (instancetype)initWithObject:(NSObject *)object {
    self = [super init];
    if (self) {
        _root = [[BinaryTreeNode alloc]init];
        _root.object = object;
    }
    return self;
}

- (void)insertObject:(NSObject *)newObject {
    
}

- (BinaryTreeNode *)find:(NSObject *)object {
    if ([object isEqualTo:<#(nullable id)#>]) {
        <#statements#>
    }
}

- (BinaryTreeNode *)deleteObject:(NSObject *)object {
    
}

@end
