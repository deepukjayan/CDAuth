//
//  CDViewController.m
//  CDAuth
//
//  Created by Deepak K on 17/05/13.
//  Copyright (c) 2013 codeWithDeepu. All rights reserved.
//

#import "CDViewController.h"
#import "CDAuth.h"


#define FS_CLIENT_ID @"LZ2DMX5KV2FOJ0ZYWNYS5MXLIXYD0SKSIJZEIMJ4ATXGNNZA"
#define FS_REDIRECT_URI @"http://www.codewithdeepu.com"

@interface CDViewController ()

@end

@implementation CDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)authFS:(id)sender {//FourSquare
    
    CDAuth *auth = [[CDAuth alloc]init];
    [auth authenticateFoursquareWithClientId:FS_CLIENT_ID andRedirectUri:FS_REDIRECT_URI fromView:self];
}

- (void)authDone:(NSDictionary *)userInfo
{
    NSLog(@"Auth success: %@",[userInfo valueForKey:@"authToken"]);
}
@end
