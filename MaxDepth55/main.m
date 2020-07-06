//
//  main.m
//  MaxDepth55
//
//  Created by Xuyang Li on 2020/7/6.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//二叉树的深度

#import <Foundation/Foundation.h>
#import "TreeNode.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}

NSInteger maxDepth(TreeNode *root){
    if (!root) {
        return 0;
    }
    return MAX(maxDepth(root.leftChild), maxDepth(root.rightChild))+1;
}
