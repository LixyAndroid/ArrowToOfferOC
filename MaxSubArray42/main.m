//
//  main.m
//  MaxSubArray42
//
//  Created by Xuyang Li on 2020/7/28.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//  剑指 Offer 42. 连续子数组的最大和

#import <Foundation/Foundation.h>

int maxSubArray(int* nums,int numsSize){
    int sumMax  = nums[0];
    for (NSUInteger i = 1; i < numsSize; i++) {
        nums[i] += MAX(nums[i-1], 0);
        sumMax  = MAX(nums[i], sumMax);
    }
    return sumMax;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...

        int nums[9] = {-2,1,-3,4,-1,2,1,-5,4};
        int numsSize = sizeof(nums)/sizeof(nums[0]);
        int res = maxSubArray(nums,numsSize);
        NSLog(@"%d",res);
    }
    return 0;
}
