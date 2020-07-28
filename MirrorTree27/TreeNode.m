//
//  TreeNode.m
//  MirrorTree27
//
//  Created by Xuyang Li on 2020/7/28.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//

#import "TreeNode.h"

@implementation TreeNode

- (instancetype)initWithData:(NSInteger)x{
    self = [super init];
    if (self) {
        self.val = x;
    }
    return self;
}


@end
