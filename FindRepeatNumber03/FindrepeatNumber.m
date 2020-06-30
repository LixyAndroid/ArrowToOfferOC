//
//  FindrepeatNumber.m
//  FindRepeatNumber03
//
//  Created by 李旭阳[产品技术中心] on 2020/6/30.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//

#import "FindrepeatNumber.h"

//数组中重复的数字
@implementation FindrepeatNumber

/**
 在一个长度为 n 的数组 nums 里的所有数字都在 0～n-1 的范围内。
 数组中某些数字是重复的，但不知道有几个数字重复了，也不知道每个数字重复了几次。请找出数组中任意一个重复的数字。
 */
- (NSInteger) methods: (NSMutableArray *) nums{
    NSMutableSet *set = [[NSMutableSet alloc] init];
    for (int i = 0; i<nums.count; i++) {
        if ([set containsObject:nums[i]]) {
            return [[nums objectAtIndex:i] integerValue];
        }
        [set addObject:nums[i]];
    }
    return -1;
}
@end
