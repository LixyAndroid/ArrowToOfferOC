//
//  main.m
//  HammingWeight15
//
//  Created by 李旭阳[产品技术中心] on 2020/6/30.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HammingWeight.h"



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        HammingWeight *hammingWeight = [[HammingWeight alloc] init];
        NSInteger n = 9;
        NSInteger res = [hammingWeight methods:n];
        NSLog(@"%ld",res);
        
    }
    return 0;
}
