//
//  ViewController.m
//  TheCountdown
//
//  Created by Xuyang Li on 2020/9/19.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//

#import "ViewController.h"

#define TIMECOUNT 60

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *firstBtn;
@property (weak, nonatomic) IBOutlet UIButton *secondBtn;
@property (weak, nonatomic) IBOutlet UIButton *thirdBtn;

@property (assign, nonatomic) NSUInteger countThread;
@property (assign, nonatomic) NSUInteger countNSTimer;

@property (nonatomic, strong) NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.countThread = TIMECOUNT;
    self.countNSTimer = TIMECOUNT;
}

- (void)viewDidDisappear:(BOOL)animated {
    //页面消失的时候暂停定时器，防止出现循环引用，导致内存泄漏
    [self.timer invalidate];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//------------***第一种方法***------------
#pragma mark 线程Thread方式实现
- (IBAction)firstBtnAction:(id)sender {
    //创建一个后台线程执行计时操作
    [self performSelectorInBackground:@selector(timerThread) withObject:nil];
}

- (void)timerThread {
    for (int i = TIMECOUNT; i > 0 ; i--) {
        self.countThread--;
        //切换到主线程中更新UI
        [self performSelectorOnMainThread:@selector(updateFirstBtn) withObject:nil waitUntilDone:YES];
        sleep(1);
    }
}

//更新UI
- (void)updateFirstBtn {
    NSString *str = nil;
    if (self.countThread == 0) {
        str = [NSString stringWithFormat:@"点击获取验证码"];
        self.firstBtn.userInteractionEnabled = YES;
    } else {
        str = [NSString stringWithFormat:@"%lu秒后重新获取",(unsigned long)self.countThread];
        self.firstBtn.userInteractionEnabled = NO;
    }
    [self.firstBtn setTitle:str forState:UIControlStateNormal];
}

//------------***第二种方法***------------
#pragma mark NSTimer实现
- (IBAction)secondBtnAction:(id)sender {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(handleTimer) userInfo:nil repeats:YES];
}
//定时操作，更新UI
- (void)handleTimer {
    if (self.countNSTimer == 0) {
        self.secondBtn.userInteractionEnabled = YES;
        [self.secondBtn setTitle:[NSString stringWithFormat:@"点击获取验证码"] forState:UIControlStateNormal];
        self.countNSTimer = TIMECOUNT;
        [self.timer invalidate];
    } else {
        self.secondBtn.userInteractionEnabled = NO;
        [self.secondBtn setTitle:[NSString stringWithFormat:@"%lu秒后重新获取",(unsigned long)self.countNSTimer] forState:UIControlStateNormal];
    }
    self.countNSTimer--;
}

//------------***第三种方法***------------
/**
 *  1、获取或者创建一个队列，一般情况下获取一个全局的队列
 *  2、创建一个定时器模式的事件源
 *  3、设置定时器的响应间隔
 *  4、设置定时器事件源的响应回调，当定时事件发生时，执行此回调
 *  5、启动定时器事件
 *  6、取消定时器dispatch源，【必须】
 *
 */
#pragma mark GCD实现
- (IBAction)thirdBtnAction:(id)sender {
    __block NSInteger second = TIMECOUNT;
    //(1)
    dispatch_queue_t quene = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //(2)
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, quene);
    //(3)
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    //(4)
    dispatch_source_set_event_handler(timer, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            if (second == 0) {
                self.thirdBtn.userInteractionEnabled = YES;
                [self.thirdBtn setTitle:[NSString stringWithFormat:@"点击获取验证码"] forState:UIControlStateNormal];
                second = TIMECOUNT;
                //(6)
                dispatch_cancel(timer);
            } else {
                self.thirdBtn.userInteractionEnabled = NO;
                [self.thirdBtn setTitle:[NSString stringWithFormat:@"%ld秒后重新获取",second] forState:UIControlStateNormal];
                second--;
            }
        });
    });
    //(5)
    dispatch_resume(timer);
}

@end
