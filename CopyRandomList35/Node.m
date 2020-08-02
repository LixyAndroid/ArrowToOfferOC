//
//  Node.m
//  CopyRandomList35
//
//  Created by Xuyang Li on 2020/8/2.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//

#import "Node.h"

@implementation Node

- (instancetype)initWithData:(NSInteger)x {
    self = [super init];
    if (self) {
        _val = x;
        _next = nil;
        _random = nil;
    }
    return self;
}
@end
