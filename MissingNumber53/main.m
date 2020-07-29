//
//  main.m
//  MissingNumber53
//
//  Created by Xuyang Li on 2020/7/29.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//  剑指 Offer 53 - II. 0～n-1中缺失的数字


#import <Foundation/Foundation.h>
//一个长度为n-1的递增排序数组中的所有数字都是唯一的，并且每个数字都在范围0～n-1之内。在范围0～n-1内的n个数字中有且只有一个数字不在该数组中，请找出这个数字。

//二分法
NSInteger missingNumber(NSArray *nums){
    NSInteger i = 0;
    NSInteger j = nums.count;
    while (i <= j) {
        NSInteger m = i+(j-i)/2;
        if ([nums[m] integerValue] == m) {
            i = m + 1;
        }else{
            j = m - 1;
        }
        
    }
    return i;

}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSArray *nums = @[@0,@1, @2, @3, @4, @6];
        NSInteger res = missingNumber(nums);
        NSLog(@"%ld",res);
        
    }
    return 0;
}
