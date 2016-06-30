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
    BinaryTreeNode *node = [[BinaryTreeNode alloc]init];
    node.object = newObject;
    
    //figure out if newObject is bigger or smaller than root.object
    if(newObject < _root.object) {
        //if smaller, set root.leftChild = node
        _root.leftChild = node;
        
    }
    else {
        //if bigger, set root.rightChild = node
        _root.rightChild = node;
    }
    
}

- (BinaryTreeNode *)find:(NSObject *)object {
//    if ([object isEqualTo:<#(nullable id)#>]) {
//        <#statements#>
//    }
    return nil;
}

- (BinaryTreeNode *)deleteObject:(NSObject *)object {
    return nil;
}

@end
