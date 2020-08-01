//
//  LXYStack.m
//  ValidateStackSequences31
//
//  Created by Xuyang Li on 2020/8/1.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//

#import "LXYStack.h"

@interface LXYStack()
@property (nonatomic, strong) NSMutableArray *stackArray;

@end

@implementation LXYStack

- (void)push:(id)value {
    if (value != nil) {
        [self.stackArray addObject:value];
    }
}

- (id)pop {
    if (self.isEmpty) {
        return nil;
    }
    id value = self.stackArray.lastObject;
    [self.stackArray removeLastObject];
    return value;
}

- (BOOL)isEmpty {
    if (self.stackArray.count == 0) {
        return YES;
    }
    return NO;
}

- (NSInteger)size {
    return  self.stackArray.count;
}

- (void)clear {
    [self.stackArray removeAllObjects];
}

- (id)top {
    if (self.isEmpty) {
        return nil;
    }
    return self.stackArray.lastObject;
}

#pragma mark - 懒加载
- (NSMutableArray *)stackArray {
    if (!_stackArray) {
        _stackArray = [NSMutableArray array];
    }
    return _stackArray;
}

@end
