//
//  ViewController.m
//  IsValid0020
//
//  Created by Xuyang Li on 2020/8/1.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//

#import "ViewController.h"
#import "LXYStack.h"

@interface ViewController ()
@property (nonatomic, strong) LXYStack *stack;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.stack = [[LXYStack alloc] init];
    
    NSString *str = @"({[]})";
    NSString *str1 = @"]{[]})";
    NSString *str2 = @"({[]})[]";
    NSLog(@"str = %@, str1 = %@, str2 = %@", [self invalidDesripter:str], [self invalidDesripter:str1], [self invalidDesripter:str2]);
}

- (NSString *)invalidDesripter:(NSString *)descripter {
    if (descripter.length == 0) {
        return @"NO";
    }
    
    NSDictionary *despriterDic = @{@"(":@")",@"[":@"]", @"{":@"}"};
    
    for (NSInteger i = 0 ; i < descripter.length; i++) {
        NSString *subStr = [descripter substringWithRange:NSMakeRange(i, 1)];
        if ([despriterDic.allKeys containsObject:subStr]) {
            [self.stack push:despriterDic[subStr]];
        }else {
            NSString *value = self.stack.pop;
            if ([value isEqualToString:subStr]) {
                continue;
            }else {
                return @"NO";
            }
        }
    }
    return @"YES";
}

@end
