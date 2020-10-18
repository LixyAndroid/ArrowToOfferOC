//
//  main.m
//  MaxSubArray
//
//  Created by Xuyang Li on 2020/9/24.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//

#import <Foundation/Foundation.h>

NSInteger maxSubArray(NSArray *nums){
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:nums];
    NSInteger sumMax = [array[0] intValue];
    
    for (int i = 1; i<array.count; i++) {
        if ([array[i-1] intValue] > 0) {
            int temp = [array[i] intValue] + [array[i-1] intValue];
            NSNumber *num = [[NSNumber alloc] initWithInt:temp];
            [array replaceObjectAtIndex:i withObject:num];
        }
        sumMax = MAX(sumMax, [array[i] intValue]);
        
    }
    return  sumMax;
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        NSArray *nums = @[@-2, @1, @-3, @4 ,@-1, @2, @1, @-5,@4];
        NSInteger res = maxSubArray(nums);
        NSLog(@"%d",res);
    }
    return 0;
}

