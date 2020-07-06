//
//  BinaryTree.m
//  TheDepthOfBinaryTree
//
//  Created by 李旭阳[产品技术中心] on 2020/7/6.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//

#import "BinaryTree.h"

@interface BinaryTree()

@property (strong, nonatomic) TreeNode *rootNode;


/** 前序遍历的完整信息（对应的扩展二叉树） */
@property (strong, nonatomic) NSMutableArray *preOrderInfo;

/** 前序创建二叉树 */
- (void)pCreateBinaryTreeInPreOrderWithTreeNode:(TreeNode *)tree;

/** 前序遍历二叉树 */
- (void)pTraversingBinaryTreeWithPreOrderWithTreeNode: (TreeNode *)preOrderTree;

/** 获取二叉树深度 */
- (NSInteger)pGetDepthOfBinaryTree:(TreeNode *)tree;

@end


@implementation BinaryTree


- (instancetype)initWithPreOrderInfo:(NSArray *)preOderInfo {
    if (self = [super init]) {
        _rootNode = [[TreeNode alloc] init];
        _preOrderInfo = [[NSMutableArray alloc] initWithArray:preOderInfo copyItems:YES];
        
        //前序解析创建
        [self pCreateBinaryTreeInPreOrderWithTreeNode:_rootNode];
    }
    return self;
}

- (void)traverseBinaryTreeInPreOrder{
    [self pTraversingBinaryTreeWithPreOrderWithTreeNode:self.rootNode];
}

//层序遍历
- (void)traverseBinaryTreeInLevelOrder{
    //设置队列（使用数组实现，第一次队列遍历都是一层节点），通过队列的先进先出方式实现遍历
    NSMutableArray *queue = [NSMutableArray arrayWithCapacity:10];
    
    //第一层入队
    if(self.rootNode){
        [queue addObject:self.rootNode];
    }
    
    //按“层”遍历
    while (queue.count) {
        //每一层挨个遍历【注意：每一层不能干扰其他层】
        NSInteger sizeOfLevel = queue.count;
        for (NSInteger index = 0; index < sizeOfLevel; index+=1) {
            //节点处队
            TreeNode *node = [queue firstObject];
            [queue removeObjectAtIndex:0];
            
            //占位结点，直接跳过
            if(!node.data){
                continue;
            }
            
            //查看左右结点，构建下一层
            if(node.leftChild){
                // 入队（为下一层准备）
                [queue addObject:node.leftChild];
            }
            
            if (node.rightChild) {
                // 入队（为下一层准备）
                [queue addObject:node.rightChild];
            }
            
        }
        
    }
    
}


- (NSInteger) depth{
    return [self pGetDepthOfBinaryTree:self.rootNode];;
}


#pragma mark - private
- (void)pCreateBinaryTreeInPreOrderWithTreeNode: (TreeNode *) tree{
    
    NSString *rootData = self.preOrderInfo.firstObject;
    if (!rootData) {
        return;
    }
    
    [self.preOrderInfo removeObjectAtIndex:0];
    if ([rootData isEqualToString:@""]) {
        return;
    }
    
    //根 - 左 - 右
    tree.data = rootData;
    tree.leftChild = [[TreeNode alloc] init];
    [self pCreateBinaryTreeInPreOrderWithTreeNode:tree.leftChild];
    
    
    tree.rightChild = [[TreeNode alloc] init];
    [self pCreateBinaryTreeInPreOrderWithTreeNode:tree.rightChild];
    
}

- (void)pTraversingBinaryTreeWithPreOrderWithTreeNode: (TreeNode *)preOrderTree {
    
    //无数据的为占位结点，跳过
    if(!preOrderTree || !preOrderTree.data){
        return;
    }
    
    
    //根左右
    NSLog(@"%@",preOrderTree.data);
    [self pTraversingBinaryTreeWithPreOrderWithTreeNode:preOrderTree.leftChild];
    [self pTraversingBinaryTreeWithPreOrderWithTreeNode:preOrderTree.rightChild];
    
}

- (NSInteger)pGetDepthOfBinaryTree:(TreeNode *)tree{
    //注意 ： 这里无数据的为占位结点
    if(!tree || !tree.data){
        return 0;
    }
    
    
    //存在节点，则自身深度为1
    //总深度由子树深度决定
    NSInteger leftChildTreeDepth = [self pGetDepthOfBinaryTree:tree.leftChild];
    NSInteger rightChildTreeDepth = [self pGetDepthOfBinaryTree:tree.rightChild];
    NSInteger childTreeDepth = MAX(leftChildTreeDepth, rightChildTreeDepth);
    return 1+childTreeDepth;
    
}

@end
