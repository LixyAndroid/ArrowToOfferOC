//
//  main.m
//  MaxProfit63
//
//  Created by Xuyang Li on 2020/8/2.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//  剑指 Offer 63. 股票的最大利润

#import <Foundation/Foundation.h>

//假设把某股票的价格按照时间先后顺序存储在数组中，请问买卖该股票一次可能获得的最大利润是多少？

//动态规划
//profit=max(profit,prices[i]−min(cost,prices[i])
NSInteger maxProfit(NSArray *prices) {
    NSInteger profit = 0;
    NSInteger cost = INT_MAX;
    
    
    for (int i = 0; i < prices.count; i++) {
        //最低价格
        cost = MIN(cost, [prices[i] integerValue]);
        //最大的利润
        profit = MAX(profit, [prices[i] integerValue] - cost);
    }
    return profit;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *numbers = @[@1, @3, @5, @8, @10];
        NSInteger res = maxProfit(numbers);
        NSLog(@"%ld",(long)res);
        
    }
    return 0;
}
