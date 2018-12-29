//
//  ViewController.m
//  FlutterD
//
//  Created by 侯佳男 on 2018/10/30.
//  Copyright © 2018年 侯佳男. All rights reserved.
//

#import "ViewController.h"

#import "TargetViewController.h"
#import <Flutter/Flutter.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 22
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushFlutterViewController {
    FlutterViewController* flutterViewController = [[FlutterViewController alloc] initWithProject:nil nibName:nil bundle:nil];
    // 设置路由名字 跳转到不同的flutter界面
    /*
    import 'dart:ui';
    
    void main() => runApp(_widgetForRoute(window.defaultRouteName));
    
    Widget _widgetForRoute(String route) {
        switch (route) {
            case 'myApp':
                return new MyApp();
            case 'home':
                return new HomePage();
            default:
                return Center(
                              child: Text('Unknown route: $route', textDirection: TextDirection.ltr),
                              );
        }
    }
    */
    
//    [flutterViewController setInitialRoute:@"home"];
    [flutterViewController setInitialRoute:@"myApp"];
    __weak __typeof(self) weakSelf = self;
    
    // 要与main.dart中一致
    NSString *channelName = @"com.pages.your/native_get";
    
    FlutterMethodChannel *messageChannel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:flutterViewController];
    
    [messageChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        // call.method 获取 flutter 给回到的方法名，要匹配到 channelName 对应的多个 发送方法名，一般需要判断区分
        // call.arguments 获取到 flutter 给到的参数，（比如跳转到另一个页面所需要参数）
        // result 是给flutter的回调， 该回调只能使用一次
        NSLog(@"method=%@ \narguments = %@", call.method, call.arguments);
        
        // method和WKWebView里面JS交互很像
        if ([call.method isEqualToString:@"iOSFlutter"]) {
            TargetViewController *vc = [[TargetViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
        if ([call.method isEqualToString:@"iOSFlutter1"]) {
            NSDictionary *dic = call.arguments;
            NSLog(@"arguments = %@", dic);
            NSString *code = dic[@"code"];
            NSArray *data = dic[@"data"];
            NSLog(@"code = %@", code);
            NSLog(@"data = %@",data);
            NSLog(@"data 第一个元素%@",data[0]);
            NSLog(@"data 第一个元素类型%@",[data[0] class]);
            
        }
        if ([call.method isEqualToString:@"iOSFlutter2"]) {
            if (result) {
                // iOSFlutter2 对应的方法flutter中主动出发 并且将下面的值（Native的值）传给flutter
                result(@"这里传值给flutter kongzichixiangjiao");
            }
        }
    }];
    
    [self.navigationController pushViewController:flutterViewController animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self pushFlutterViewController];
}

@end

