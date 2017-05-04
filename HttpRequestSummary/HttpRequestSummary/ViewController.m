//
//  ViewController.m
//  HttpRequestSummary
//
//  Created by chen on 2017/5/5.
//  Copyright © 2017年 chen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //1 初始化url
    NSURL *demoUrl = [NSURL URLWithString:@"http://127.0.0.1/demo.json"];
    
    //2 建立request请求
    NSMutableURLRequest *demoRequest = [NSMutableURLRequest requestWithURL:demoUrl cachePolicy:0 timeoutInterval:15.0];
    
    
    //3 建立connetion连接，发起异步请求
    NSOperationQueue *demoQueue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:demoRequest queue:demoQueue completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSData *receiveData = data;
            
        });
        
    } ];
    
    
    //4 如果200的话，返回服务端二进制数据，其它的返回错误。
    
    

    
    
}
@end
