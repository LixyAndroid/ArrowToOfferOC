//
//  LXYStack.h
//  ValidateStackSequences31
//
//  Created by Xuyang Li on 2020/8/1.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LXYStack : NSObject

//添加一个数据
- (void)push: (id)value;
//弹出一个数据
- (id)pop;
//是否为空
- (BOOL)isEmpty;
//大小
- (NSInteger)size;
//清空
- (void)clear;
//获取顶部的元素
- (id)top;

@end

NS_ASSUME_NONNULL_END
