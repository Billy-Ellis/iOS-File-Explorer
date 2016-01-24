//
//  ImagesViewController.m
//  iFiles
//
//  Created by Billy Ellis on 21/01/2016.
//  Copyright © 2016 Billy Ellis. All rights reserved.
//

#import "ImagesViewController.h"
#import "CustomIOSAlertView.h"

@interface ImagesViewController ()

@end

@implementation ImagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    textField = [[UITextField alloc]initWithFrame:CGRectMake(20,70,self.view.frame.size.width - 40,30)];
    
    textField.borderStyle = UITextBorderStyleRoundedRect;
    
    textField.placeholder = @"Enter a path of image to view";
    
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
    
    CustomIOSAlertView *alertView = [[CustomIOSAlertView alloc] init];
    
    // Add some custom content to the alert view
    [alertView setContainerView:[self createDemoView]];
    
    // Modify the parameters
    [alertView setButtonTitles:[NSMutableArray arrayWithObjects:@"Dismiss", nil]];
    [alertView setDelegate:self];
    
    // You may use a Block, rather than a delegate.
    [alertView setOnButtonTouchUpInside:^(CustomIOSAlertView *alertView, int buttonIndex) {
        NSLog(@"Block: Button at position %d is clicked on alertView %d.", buttonIndex, (int)[alertView tag]);
        [alertView close];
    }];
    
    [alertView setUseMotionEffects:true];
    
    // And launch the dialog
    [alertView show];
    
    [textField resignFirstResponder];

    
    //image
    
    /*UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    image.image = [UIImage imageWithContentsOfFile:path];
    
    [alert addSubview:image];
    
    [alert show];
    
    theImage.image = [UIImage imageWithContentsOfFile:path];*/

}

- (void)customIOS7dialogButtonTouchUpInside: (CustomIOSAlertView *)alertView clickedButtonAtIndex: (NSInteger)buttonIndex
{
    NSLog(@"Alert closed");
    [alertView close];
}


- (UIView *)createDemoView
{
    UIView *demoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 180, 180)];
    
    UILabel *nilLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 30,100, 40)];
    nilLabel.text = @"null";
    [demoView addSubview:nilLabel];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 150, 150)];
    [imageView setImage:[UIImage imageWithContentsOfFile:path]];
    [demoView addSubview:imageView];
    
    return demoView;
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
