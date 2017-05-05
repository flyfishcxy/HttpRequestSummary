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
        
        //4 如果不是200的话，返回其它的错误。
        if (connectionError || data == nil) {
            NSLog(@"%@--您的网路不给力，请稍后重试",connectionError);
            return;
        }
        
        //5 如果200的话，返回服务端二进制数据。
        NSLog(@"返回数据=%@",data);
        //
        NSLog(@"那个线程在执行 =%@",[NSThread currentThread]);
        
        //6 更新ui在主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            //对网络请求完成调用这块代码，返回服务端二进制数据。
//           NSString *retunString =  [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//            
//            NSLog(@"返回数据= %@",retunString);
            
            
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            NSLog(@"----返回数据dic=%@----",dic);
            
            
        });
        
    } ];
    
    
    
    

    
    
}
@end
