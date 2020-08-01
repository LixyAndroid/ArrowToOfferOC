//
//  main.m
//  ValidateStackSequences31
//
//  Created by Xuyang Li on 2020/8/1.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//  剑指 Offer 31. 栈的压入、弹出序列

#import <Foundation/Foundation.h>
#import "LXYStack.h"

BOOL validateStackSequences(NSArray *pushed, NSArray *popped) {
    LXYStack *stack = [[LXYStack alloc] init];
    NSInteger i = 0;
    for (NSUInteger j = 0; j < pushed.count; j++) {
        [stack push:pushed[j]];
        while (![stack isEmpty] && [[stack top] integerValue] == [popped[i] integerValue]) {
            [stack pop];
            i++;
        }
    }
    return [stack isEmpty];
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        NSArray *pushed = @[@1,@2,@3,@4,@5];
        NSArray *popped = @[@4,@5,@3,@2,@1];
        BOOL isvalidateStack = validateStackSequences(pushed, popped);
        NSLog(@"%hhd",isvalidateStack);
    }
    return 0;
}
