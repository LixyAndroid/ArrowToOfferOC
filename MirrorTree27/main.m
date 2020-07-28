//
//  main.m
//  MirrorTree27
//
//  Created by Xuyang Li on 2020/7/28.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//  剑指 Offer 27. 二叉树的镜像
// 反转二叉树

#import <Foundation/Foundation.h>
#import "TreeNode.h"

///递归解法
TreeNode* mirrorTree(TreeNode* root) {
    if (!root) {
        return nil;
    }
    TreeNode *tmp = root.left;
    root.left = mirrorTree(root.right);
    root.right = mirrorTree(tmp);

    return root;
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}

