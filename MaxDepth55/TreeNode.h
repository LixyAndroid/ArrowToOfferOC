//
//  TreeNode.h
//  MaxDepth55
//
//  Created by Xuyang Li on 2020/7/6.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TreeNode : NSObject

@property (assign, nonatomic) NSInteger value;

/// 左结点
@property (strong, nonatomic) TreeNode *leftChild;

/// 右结点
@property (strong, nonatomic) TreeNode *rightChild;

+ (instancetype)nodeWithValue:(NSInteger)value;

@end

NS_ASSUME_NONNULL_END
