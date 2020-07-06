//
//  BinaryTree.h
//  TheDepthOfBinaryTree
//
//  Created by 李旭阳[产品技术中心] on 2020/7/6.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TreeNode.h"

NS_ASSUME_NONNULL_BEGIN

@interface BinaryTree : NSObject

/** 根结点 */
@property (readonly, nonatomic) TreeNode *rootNode;

/** 深度 */
@property (readonly, nonatomic) NSInteger depth;

/** 创建前序遍历二叉树*/

- (instancetype)initWithPreOrderInfo: (NSArray *) preOderInfo;

/** 前序遍历二叉树 */
- (void)traverseBinaryTreeInPreOrder;

/** 层序遍历二叉树（广度优先遍历） */
- (void)traverseBinaryTreeInLevelOrder;

@end

NS_ASSUME_NONNULL_END
