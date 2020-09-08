//
//  ViewController.m
//  StrongCopyLearn
//
//  Created by Xuyang Li on 2020/9/7.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSString *strongString;
@property (nonatomic, copy) NSString *copyedString;
@property (nonatomic,strong) UILabel *outputLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.outputLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 200, 300, 100)];
    [self.view addSubview:self.outputLabel];
    
    
    NSMutableString *string = [NSMutableString stringWithFormat:@"aaa"];
    self.strongString = string;
    self.copyedString = string;
    //string = [NSMutableString stringWithFormat:@"aaa"];
    NSLog(@"origin string: %p, %p", string, &string);
    NSLog(@"strong string: %p, %p", _strongString, &_strongString);
    NSLog(@"copy string: %p, %p", _copyedString, &_copyedString);
    self.outputLabel.text = [NSString stringWithFormat:@"origin string:%@\n,strong string:%@\n,copy string %@",string,_strongString,_copyedString];
    [string appendString:@"bbb"];
    NSLog(@"origin string: %@,%p, %p",string, string, &string);
    NSLog(@"strong string: %@,%p, %p",_strongString, _strongString, &_strongString);
    NSLog(@"copy string: %@,%p, %p", _copyedString,_copyedString, &_copyedString);
    self.outputLabel.text = [NSString stringWithFormat:@"origin string:%@\n,strong string:%@\n,copy string %@",string,_strongString,_copyedString];
    
    
    NSLog(@"======================================================");
    NSString *stringNSString = [NSString stringWithFormat:@"aaa"];
    self.strongString = stringNSString;
    self.copyedString = stringNSString;
    /// stringNSString = [NSMutableString stringWithFormat:@"aaa"];  这样地址就会变，NSString不会变
    NSLog(@"origin string: %@, %p, %p", _copyedString,stringNSString, &stringNSString);
    NSLog(@"strong string:%@, %p, %p", _copyedString,_strongString, &_strongString);
    NSLog(@"copy string:%@, %p, %p", _copyedString,_copyedString, &_copyedString);
    self.outputLabel.text = [NSString stringWithFormat:@"origin string:%@\n,strong string:%@\n,copy string %@",stringNSString,_strongString,_copyedString];
}


@end
