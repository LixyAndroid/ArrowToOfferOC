//
//  Sort.m
//  QuickSork
//
//  Created by 李旭阳[产品技术中心] on 2020/7/10.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//

#import "Sort.h"

@implementation Sort

+ (void)quickSort:(NSMutableArray *)arr low:(int)low high:(int)high{
    if (low >= high) {
        return;
    }
    int i = low;
    int j = high;
    id key = arr[i];
    while (i<j) {
        while (i<j && [arr[j] intValue] >= [key intValue]) {
            j--;
        }
        if (i == j) { // 当key是目前最小的数时，会出现i=j的情况，
            break;
        }
        arr[i++] = arr[j]; // i++ 会减少一次m[i]和key的比较
 
        while (i < j && [arr[i] intValue] <= [key intValue]) {
            i++;
        }
        if (i == j) { // 当key是目前最大的数时(m[j]的前面)，会出现i=j的情况
            break;
        }
        arr[j--] = arr[i]; //j-- 会减少一次m[j]和key的比较
    }
    arr[i] = key;
    [self quickSort: arr low: low high: i-1];
    [self quickSort: arr low: i+1 high: high];
}

@end
