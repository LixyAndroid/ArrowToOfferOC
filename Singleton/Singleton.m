//
//  Singleton.m
//  Singleton
//
//  Created by Xuyang Li on 2020/6/30.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//

#import "Singleton.h"

static Singleton *instance = nil;

@implementation Singleton

//使用@synchronized加锁，不过虽然保证了线程安全但是由于锁的存在当多线程访问时，性能会降低
+ (Singleton *)shardInstance {
    
    @synchronized (self) {
        if (!instance) {
            instance = [[super alloc] init];
        }
    }
    return instance;
}

@end
