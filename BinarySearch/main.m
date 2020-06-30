//
//  main.m
//  BinarySearch
//
//  Created by Xuyang Li on 2020/6/30.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//

//二分查找
#import <Foundation/Foundation.h>

/**
 查找最近的目标索引
 */

NSInteger findNearerstIndex(NSArray *source,NSInteger targetNumber){
    
    NSInteger count = source.count;
    
    //数组为空
    if(!count){
        return 0;
    }
    
    NSInteger lowIndex = 0;
    NSInteger highIndex = count;
    
    while (lowIndex<highIndex) {
        //中间索引
        NSInteger  midIndex = lowIndex +(highIndex-lowIndex)/2;
        
        if ([source[midIndex] integerValue ] == targetNumber) {
            return midIndex;
        }else if([source[midIndex] integerValue] > targetNumber){//中间值大
            // 左半部分继续查找
            highIndex = midIndex;
        }else{
            //右半部分继续查找
            lowIndex = midIndex+1;
        }
        
    }
    return lowIndex;
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        NSArray *numbers = @[@1, @3, @5, @8, @10];
        NSInteger target = 8;
        NSInteger result = findNearerstIndex(numbers, target);
        NSLog(@"%ld", result);
    }
    return 0;
}
