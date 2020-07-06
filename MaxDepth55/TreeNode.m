//
//  TreeNode.m
//  MaxDepth55
//
//  Created by Xuyang Li on 2020/7/6.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//

#import "TreeNode.h"

@implementation TreeNode

+ (instancetype)nodeWithValue:(NSInteger)value{
    TreeNode *node = [[super alloc] init];
    node.value  = value;
    return node;
}

@end
