//
//  main.m
//  MyPow16
//
//  Created by Xuyang Li on 2020/7/31.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//  剑指 Offer 16. 数值的整数次方

#import <Foundation/Foundation.h>

//实现函数double Power(double base, int exponent)，求base的exponent次方。
//不得使用库函数，同时不需要考虑大数问题。

double myPow(double x, int n) {
    if (x == 0) {
        return 0;
    }
    
    long b = n;
    if (b<0) {
        x = 1/x;
        b = -b;
    }
    double res = 1.0;
    
    while (b > 0) {
        if (b & 1 ) {
            res *= x;
        }
        x *= x;
        b >>= 1;
    }
    return res;
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        double res = myPow(2.0, -5);
        NSLog(@"%f",res);
    }
    return 0;
}
