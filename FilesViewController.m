//
//  FilesViewController.m
//  iFiles
//
//  Created by Billy Ellis on 21/01/2016.
//  Copyright © 2016 Billy Ellis. All rights reserved.
//

#import "FilesViewController.h"

@interface FilesViewController ()

@end

@implementation FilesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    textField = [[UITextField alloc]initWithFrame:CGRectMake(20,70,self.view.frame.size.width - 40,30)];
    
    textField.borderStyle = UITextBorderStyleRoundedRect;
    
    textField.placeholder = @"Enter a path of file to view";
    
    [self.view addSubview:textField];
    
    
    //button
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(self.view.frame.size.width/2-50,self.view.frame.size.height*0.25-25,100,50);
    [button setTitle:@"View" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(viewFiles) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

}

-(void)viewFiles{
    
    path = textField.text;
    
    NSError *error = nil;
    
    //NSArray *contentsArray = [[NSFileManager defaultManager]contentsOfDirectoryAtPath:path error:&error];
    
    NSString *txtFilePath = textField.text;
    
    NSString *contentsArray = [NSString stringWithContentsOfFile:txtFilePath encoding:NSUTF8StringEncoding error:NULL];
    
    NSString *contentsString = [NSString stringWithFormat:@"%@",contentsArray];
    
    NSString *titleString = [NSString stringWithFormat:@"%@%@", @"Contents of ", txtFilePath];
    
    //alert
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:titleString message:contentsString delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
    
    [alert show];

    
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
