//
//  TargetViewController.m
//  IOS_OC
//
//  Created by 侯佳男 on 2018/12/29.
//  Copyright © 2018年 侯佳男. All rights reserved.
//

#import "TargetViewController.h"

@interface TargetViewController ()
@property (weak, nonatomic) IBOutlet UILabel *l;

@end

@implementation TargetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.l.text = self.parames;
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

@end
