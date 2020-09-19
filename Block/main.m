//
//  main.m
//  Block
//
//  Created by Xuyang Li on 2020/9/18.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//

#import <Foundation/Foundation.h>
void blockTest(){
    static int num = 10;
    void (^block)(void) = ^{
        NSLog(@"%d",num);
        num = 30;
    };
    num = 20;
    block();
    NSLog(@"%d",num);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        blockTest();
    }
    return 0;
}
