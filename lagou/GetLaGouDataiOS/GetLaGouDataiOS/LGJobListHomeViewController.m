//
//  LGJobListHomeViewController.m
//  GetLaGouDataiOS
//
//  Created by Johnson on 2017/3/25.
//  Copyright © 2017年 Johnson. All rights reserved.
//

#import "LGJobListHomeViewController.h"
#import "TestVC.h"
#import "Test1VC.h"
#import "Header.h"
#import <objc/runtime.h>
#import "NSObject+MJKeyValue.h"

@interface LGJobListHomeViewController ()

@end

@implementation LGJobListHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //%orig;
    
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"===========" forState:UIControlStateNormal];
    btn.frame = CGRectMake(55, 333, 111, 40);
//    [self.view addSubview:btn];
    
    
    
    //本地创建配置表， 可更改。。。
    NSLog(@"------o-------拉钩：  搜索内容及时间可在本地进行修改 /Documents/lgConfig.plist");
    if (![[NSFileManager defaultManager] fileExistsAtPath:LgConfigPath]) {
        
        [@{
          @"kKeyword" : @"iOS",
          @"kUseAnalogData" : @(YES),
          @"kUpdateInterval" : @(25),
          @"kUpdatePage" : @(10),
          @"kUpdatePageInterval" : @(2),
          } writeToFile:LgConfigPath atomically:YES];
    
    }

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width - 30, SCREEN_HEIGHT - 50 - 30, 30, 30);
    [button setTitle:@"" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:11.f];
    [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(appleButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveTest:)];
    [button addGestureRecognizer:pan];
    
    
    SetPushSearchVCTimer([NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(initSearchVC) userInfo:nil repeats:YES]);
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}









- (void)appleButtonClick
{
    UIWindow *window = [self.view viewWithTag:357];
    window.hidden = !window.hidden;
}

- (void)moveTest:(UIGestureRecognizer *)gestureRecognizer
{
    gestureRecognizer.view.center = [gestureRecognizer locationInView:[[[UIApplication sharedApplication] delegate] window]];
}


- (void)initSearchVC
{
    
    LGChatSession *lgSession = [NSClassFromString(@"LGChatSession") mj_objectWithKeyValues:[NSKeyedUnarchiver unarchiveObjectWithFile:LgSessionPath]];
    if (lgSession) {
        
        [GetPushSearchVCTimer invalidate];
        SetPushSearchVCTimer(nil);
        NSLog(@"------o-------拉钩：  初始化SearchVC成功！！！");
        
        
        
        LGSearchViewController *vc = [[NSClassFromString(@"LGSearchViewController") alloc] init];
        UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:vc];
    
        
        UIWindow *window = [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        window.backgroundColor = [UIColor redColor];
        window.tag = 357;
        [window makeKeyAndVisible];
        window.rootViewController = nvc;
        [self.view addSubview:window];
    
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width - 30, SCREEN_HEIGHT - 50 - 30, 30, 30);
        [button setTitle:@"" forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:11.f];
        [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(appleButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [window addSubview:button];
    
        
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [vc searchWithKeyword:kKeyword];
        });
        
    }else {
        NSLog(@"------o-------拉钩：  对话消息不存在，请先选择一对话人");
    }
    
}

@end
