//
//  main.m
//  LevelOrder32
//
//  Created by Xuyang Li on 2020/7/21.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//  从上到下打印二叉树

#import <Foundation/Foundation.h>
#import "TreeNode.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}

NSArray *levelOrder(TreeNode *root){
    if (!root) {
        return nil;
    }
    
    NSMutableArray *queue = [[NSMutableArray alloc] initWithObjects:root, nil];
    NSMutableArray *ans = [[NSMutableArray alloc] init];
    while (queue) {
        TreeNode * node = queue.firstObject;
        NSNumber *number = [[NSNumber alloc] initWithInteger:node.val];
        [ans addObject:number];
        if (!node.left) {
            [queue addObject:node.left];
        }
        if (!node.right) {
            [queue addObject:node.right];
        }
        
    }
    
    NSArray *res = [[NSArray alloc] initWithArray:ans];
    return res;
    
}
