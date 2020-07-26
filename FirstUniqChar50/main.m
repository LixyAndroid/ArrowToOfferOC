//
//  main.m
//  FirstUniqChar50
//
//  Created by Xuyang Li on 2020/7/26.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//  剑指 Offer 50. 第一个只出现一次的字符

#import <Foundation/Foundation.h>

NSString* firstUniqChar(NSString *c){
    NSMutableDictionary<NSString*, NSNumber*> *dic = [[NSMutableDictionary alloc] init];
    for (NSUInteger i =0; i < c.length; i++) {
        //i的字符
        NSString *s = [c substringWithRange:NSMakeRange(i, 1)];
        //是否包含s
        BOOL isContainsS = [[dic allKeys] containsObject:s];
        //BOOL转NSNumber
        NSNumber *boolNumber = [NSNumber numberWithBool:!isContainsS];
        [dic setObject:boolNumber forKey:s];
    }
    
    for (NSUInteger i = 0; i < c.length; i++) {
        NSString *s = [c substringWithRange:NSMakeRange(i, 1)];
        //NSNumber转BOOL
        BOOL b = [[dic objectForKey:s] boolValue];
        if (b) {
            return s;
        }
    }
    return @" ";
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSString *string = @"lleetcode";
        NSString *res = firstUniqChar(string);
        NSLog(@"%@", res);
    }
    return 0;
}
