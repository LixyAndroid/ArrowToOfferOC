//
//  TreeNode.h
//  LevelOrder32
//
//  Created by Xuyang Li on 2020/7/21.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TreeNode : NSObject

@property (assign, nonatomic) NSInteger val;

/// 左结点
@property (strong, nonatomic) TreeNode *left;

/// 右结点
@property (strong, nonatomic) TreeNode *right;

- (instancetype)initWithData:(NSInteger)x;


@end

NS_ASSUME_NONNULL_END
