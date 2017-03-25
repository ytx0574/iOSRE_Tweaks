//
//  Test1VC.m
//  GetLaGouDataiOS
//
//  Created by Johnson on 2017/3/25.
//  Copyright © 2017年 Johnson. All rights reserved.
//

#import "Test1VC.h"

@interface Test1VC ()

@end

@implementation Test1VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)tableView:(id)arg1 didSelectRowAtIndexPath:(id)arg2
{
    
    //保留类本身的逻辑  如果自动获取数据 屏蔽详情查看
    UINavigationController *nvc = [(id)[[self nextResponder] nextResponder] navigationController];
    if([nvc isKindOfClass:NSClassFromString(@"LGNavigationController")]) {
//        %orig;
    }else {
        [[[UIAlertView alloc] initWithTitle:nil message:@"自动获取数据中，不可查看详情。  请到原有页面查看" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil] show];
    }
    
}

@end
