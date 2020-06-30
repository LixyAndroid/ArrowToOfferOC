//
//  LinkNode.h
//  ReverseLinkList
//
//  Created by Xuyang Li on 2020/6/30.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LinkNode : NSObject

@property (nonatomic, strong, nonnull) LinkNode *next;
@property (nonatomic,assign) NSInteger data;

@end

NS_ASSUME_NONNULL_END
