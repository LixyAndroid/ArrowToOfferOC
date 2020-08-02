//
//  Node.h
//  CopyRandomList35
//
//  Created by Xuyang Li on 2020/8/2.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Node : NSObject

@property (assign, nonatomic) NSInteger val;
@property (strong, nonatomic) Node *next;
@property (strong, nonatomic) Node *random;


- (instancetype)initWithData:(NSInteger)x;

@end

NS_ASSUME_NONNULL_END
