//
//  HammingWeight.m
//  HammingWeight15
//
//  Created by 李旭阳[产品技术中心] on 2020/6/30.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//

#import "HammingWeight.h"

//二进制中1的个数
@implementation HammingWeight

//请实现一个函数，输入一个整数，输出该数二进制表示中 1 的个数。例如，把 9 表示成二进制是 1001，有 2 位是 1。因此，如果输入 9，则该函数输出 2。

/**
 算法：
 (n−1) 解析： 二进制数字 n 最右边的 1 变成 0 ，此 1 右边的 0 都变成 1 。
 n&(n−1) 解析： 二进制数字 n 最右边的 1 变成 0 ，其余不变。

 
 算法流程：
 1,初始化数量统计变量 res。
 2,循环消去最右边的 11 ：当 n = 0n=0 时跳出。
    res += 1 ： 统计变量加 11 ；
    n &= n - 1 ： 消去数字 nn 最右边的 11 。
 3,返回统计数量 res。


 */
- (NSInteger) methods: (NSInteger) n{
    NSInteger res = 0;
    while (n !=0 ) {
        n = n & (n-1);
        res++;
    }
    return res;
}
@end
