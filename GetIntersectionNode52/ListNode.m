//
//  ListNode.m
//  GetIntersectionNode52
//
//  Created by Xuyang Li on 2020/7/16.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//

#import "ListNode.h"

@implementation ListNode

- (instancetype)initWithData:(int)x {
    self = [super init];
    if (self) {
        self.val = x;
        self.next = nil;
    }
    return self;
}
@end
