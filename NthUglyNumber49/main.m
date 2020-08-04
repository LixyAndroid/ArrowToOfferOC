//
//  main.m
//  NthUglyNumber49
//
//  Created by Xuyang Li on 2020/8/4.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//  剑指 Offer 49. 丑数

#import <Foundation/Foundation.h>
/// 我们把只包含质因子 2、3 和 5 的数称作丑数（Ugly Number）。求按从小到大的顺序的第 n 个丑数。
NSInteger nthUglyNumber(NSInteger n) {
    NSInteger a = 0, b = 0, c = 0;
    //这样创建一个n长度的数组
    NSMutableArray *dp = [[NSMutableArray alloc] initWithCapacity:n];
    NSNumber *number = [[NSNumber alloc] initWithInteger:1];
    dp[0] = number;
    
    for (NSUInteger i = 1; i < n; i++) {
        NSInteger n2 = [dp[a] integerValue] * 2;
        NSInteger n3 = [dp[b] integerValue] * 3;
        NSInteger n5 = [dp[c] integerValue] * 5;
        NSNumber *number = [[NSNumber alloc] initWithInteger:MIN(MIN(n2, n3), n5)];

        dp[i] = number;
        if ([dp[i] integerValue] == n2) {
            a++;
        }
        if ([dp[i] integerValue] == n3) {
            b++;
        }
        if ([dp[i] integerValue] == n5) {
            c++;
        }

    }
    return [dp[n-1] integerValue];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSInteger res = nthUglyNumber(10);
        NSLog(@"%ld",res);
    }
    return 0;
}
