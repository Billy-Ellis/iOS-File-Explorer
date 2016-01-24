//
//  ViewController.m
//  iFiles
//
//  Created by Billy Ellis on 21/01/2016.
//  Copyright © 2016 Billy Ellis. All rights reserved.
//

#import "ViewController.h"
#import "sys/utsname.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    struct utsname systemInfo;
    uname(&systemInfo);
    
    NSString *device = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    NSString *vers = [[UIDevice currentDevice]systemVersion];
    
    NSString *full = [NSString stringWithFormat:@"%@%@%@%@",@"This device is: ",device,@" ",vers];
    deviceLabel.text = full;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
