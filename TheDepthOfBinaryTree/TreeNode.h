//
//  TreeNode.h
//  TheDepthOfBinaryTree
//
//  Created by 李旭阳[产品技术中心] on 2020/7/6.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TreeNode : NSObject

/**数据 */
@property (strong, nonatomic) NSString *data;

/**左 */
@property (strong, nonatomic) TreeNode *leftChild;

/**右 */
@property (strong, nonatomic) TreeNode *rightChild;

@end

NS_ASSUME_NONNULL_END
