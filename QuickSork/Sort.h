//
//  Sort.h
//  QuickSork
//
//  Created by 李旭阳[产品技术中心] on 2020/7/10.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Sort : NSObject

+ (void)quickSort:(NSMutableArray *)m low:(int)low high:(int)high;

@end

NS_ASSUME_NONNULL_END
