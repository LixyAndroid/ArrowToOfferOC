//
//  ListNode.h
//  GetKthFromEnd22
//
//  Created by Xuyang Li on 2020/8/3.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListNode : NSObject

@property (nonatomic, strong, nonnull) ListNode *next;
@property (nonatomic,assign) NSInteger data;

- (instancetype)initWithData:(NSInteger)x;

@end

NS_ASSUME_NONNULL_END
