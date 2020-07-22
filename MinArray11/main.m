//
//  main.m
//  MinArray11
//
//  Created by Xuyang Li on 2020/7/22.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//

#import <Foundation/Foundation.h>

NSInteger minArray(NSArray* numbers){
    NSInteger low = 0;
    NSInteger high = numbers.count-1;
    while (low<high) {
        NSInteger pivot = low + (high-low)/2;
        
        if ([numbers[pivot] integerValue] < [numbers[high] integerValue]) {
            high = pivot;
        }else if([numbers[pivot] integerValue] > [numbers[high] integerValue]){
            low = pivot + 1;
        }else{
            high -=1;
        }
        
    }
    return [numbers[low] integerValue];
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSArray* numbers = [NSArray arrayWithObjects:@3,@4,@5,@6,@1,@2, nil];;
        NSInteger res = minArray(numbers);
        NSLog(@"%ld",res);
        
    }
    return 0;
}


