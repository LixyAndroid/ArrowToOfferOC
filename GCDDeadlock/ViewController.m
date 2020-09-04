//
//  ViewController.m
//  GCDDeadlock
//
//  Created by Xuyang Li on 2020/9/1.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //    NSLog(@"start");
    //    dispatch_async(dispatch_get_main_queue(), ^{
    //        NSLog(@"middle");
    //    });
    //    NSLog(@"end");
    
    
    NSLog(@"A");
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"异步，dispatch_get_main_queue");
        NSLog(@"%@",[NSThread currentThread]);
        
    });
    
    NSLog(@"B");
    // [NSThread sleepForTimeInterval:4];
    NSLog(@"C");
    
    NSLog(@"============================");
    
    
    NSLog(@"A");
    dispatch_async(dispatch_queue_create(0, 0), ^{
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"同步");
            NSLog(@"%@",[NSThread currentThread]);
            
        });
    });
    NSLog(@"B");
    // [NSThread sleepForTimeInterval:4];
    NSLog(@"C");
    
    dispatch_queue_t q = dispatch_queue_create("myThead1", DISPATCH_QUEUE_PRIORITY_DEFAULT);
    dispatch_sync(q, ^{
        NSLog(@"同步");
        NSLog(@"%@",[NSThread currentThread]);
    });
    
    dispatch_queue_t q2 = dispatch_queue_create("myThead2", DISPATCH_QUEUE_PRIORITY_DEFAULT);
    
    dispatch_async(q2, ^{
        NSLog(@"异步");
        NSLog(@"%@",[NSThread currentThread]);
    });
    
    NSLog(@"%@",self);
    
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(testThread:) object:@"我是参数"];
    
    
    // 当使用初始化方法出来的主线程需要start启动
    [thread start];
    //    NSLog(@"我是逗比");
    // 可以为开辟的子线程起名字
    thread.name = @"我是第二条线程";
    // 调整Thread的权限 线程权限的范围值为0 ~ 1 。越大权限越高，先执行的概率就会越高，由于是概率，所以并不能很准确的的实现我们想要的执行顺序，默认值是0.5
    thread.threadPriority = 0.5;
}

-(void)testThread:(NSString *)testString{
    // 如果子线程是我们手动开辟的，那么就需要我们来管理它运行所造成的资源回收
    @autoreleasepool {
        NSLog(@"参数----%@",testString);
        NSLog(@"testThread -- %@",[NSThread currentThread]);
        double sum = 0;
        for (int i = 1; i < 635500000; i ++) {
            sum += i;
        }
        NSLog(@"sum = %f---- %@",sum,[NSThread currentThread]);
        // 回到主线程 所有的NSObject对象或者NSobject的子类都有该方法，他是NSthread的另一种体现方式
        // waitUntilDone:是否将该回调方法执行完在执行后面的代码，如果为YES:就必须等回调方法执行完成之后才能执行后面的代码，说白了就是阻塞当前的线程，如果是NO：就是不等回调方法结束。不会阻塞当前线程
        
        // 回到主线程
        [self performSelectorOnMainThread:@selector(backMainThread) withObject:nil waitUntilDone:YES];
    }
}
- (void)backMainThread{
    NSLog(@"回到主线程");
}


@end
