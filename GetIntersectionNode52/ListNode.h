//
//  ListNode.h
//  GetIntersectionNode52
//
//  Created by Xuyang Li on 2020/7/16.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListNode : NSObject

@property (assign, nonatomic) NSInteger val;
@property (strong, nonatomic) ListNode *next;

- (instancetype)initWithData:(int)x;
@end

NS_ASSUME_NONNULL_END
