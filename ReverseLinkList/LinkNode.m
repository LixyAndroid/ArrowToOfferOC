//
//  LinkNode.m
//  ReverseLinkList
//
//  Created by Xuyang Li on 2020/6/30.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//

#import "LinkNode.h"

@implementation LinkNode

//当用%@打印某个对象时,会调用该对象的description方法。
- (NSString *)description{
    if (self.next) {
        return [NSString stringWithFormat:@"%ld -> %@",self.data,self.next];
    }
    return [NSString stringWithFormat:@"%ld",self.data];
}

@end
