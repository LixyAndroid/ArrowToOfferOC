//
//  main.m
//  FindNumberIn2DArray04
//
//  Created by Xuyang Li on 2020/8/1.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//  剑指 Offer 04. 二维数组中的查找

#import <Foundation/Foundation.h>
////在一个 n * m 的二维数组中，每一行都按照从左到右递增的顺序排序，
// 每一列都按照从上到下递增的顺序排序。请完成一个函数，输入这样的一个二维数组和一个整数，判断数组中是否含有该整数。
BOOL findNumberIn2DArray(NSArray<NSArray *> *matrix, NSInteger target) {
    if (!matrix || matrix.count == 0 || [matrix objectAtIndex:0].count == 0) {
        return NO;
    }
    
    NSUInteger i = 0;
    NSUInteger j = [matrix objectAtIndex:0].count - 1;
    while (i < matrix.count && j >= 0) {
        
        if ([[[matrix objectAtIndex:i] objectAtIndex:j] integerValue] > target) {
            j--;
        }else if ([[[matrix objectAtIndex:i] objectAtIndex:j] integerValue] < target) {
            i++;
        }else{
            return YES;
        }
        
    }
    
    return NO;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        NSArray  *matrix = [[NSArray alloc] initWithObjects:
                                    [NSArray arrayWithObjects:@1, @4,@7,@11,@15, nil],
                                    [NSArray arrayWithObjects:@2, @5, @8,@12,@19, nil],
                                    [NSArray arrayWithObjects:@3, @6, @9, @12,@22, nil],
                                    [NSArray arrayWithObjects:@10, @13, @14, @17, @24,nil],
                                    [NSArray arrayWithObjects:@18, @21, @23, @26, @30,nil],
                                    nil];
        BOOL res = findNumberIn2DArray(matrix, 5);
        NSLog(@"%hhd",res);
        
    }
    return 0;
}
