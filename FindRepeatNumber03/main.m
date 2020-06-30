//
//  main.m
//  FindRepeatNumber03
//
//  Created by 李旭阳[产品技术中心] on 2020/6/30.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FindrepeatNumber.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        NSMutableArray *arr = [[NSMutableArray alloc] initWithArray:@[@1, @10,@5,@2, @3, @4, @5,@2]];
        
        
        FindrepeatNumber *findrepeatNumber = [[FindrepeatNumber alloc] init];
        
        NSInteger num = [findrepeatNumber methods:arr];
        
        NSLog(@"%d",num);
      
        
    }
    return 0;
}






