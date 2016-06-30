//
//  BinaryTreeNode.h
//  BinarySearchP2
//
//  Created by Yevhen Kim on 2016-06-28.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BinaryTreeNode : NSObject

@property (nonatomic, strong) NSObject *object;
@property (nonatomic, strong) BinaryTreeNode *leftChild;
@property (nonatomic, strong) BinaryTreeNode *rightChild;
@property (nonatomic, strong) BinaryTreeNode *parent;


- (BOOL)isLeftChildParent;

@end
