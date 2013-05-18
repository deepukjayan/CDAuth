//
//  CDAuthBrowserViewController.m
//  CDAuth
//
//  Created by Deepak K on 17/05/13.
//  Copyright (c) 2013 codeWithDeepu. All rights reserved.
//

#import "CDAuthBrowserViewController.h"

@interface CDAuthBrowserViewController ()

@end

@implementation CDAuthBrowserViewController

@synthesize authType = _authType;
@synthesize redirectUri = _redirectUri;
@synthesize browser = _browser;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.browser.delegate = self;
    [self.browser loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.authUri]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Delegates

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if (self.authType == FS) {
        NSString *url =[[request URL] absoluteString];
        
        if ([url rangeOfString:@"foursquare.com"].length == 0) {
         
            NSArray *arr = [url componentsSeparatedByString:@"="];
            NSMutableDictionary *userInfo = [[NSMutableDictionary alloc]init];
            [userInfo setObject:arr[1] forKey:@"authToken"];
            [self notifyWithObject:userInfo andName:@"authDone"];
            [self dismissModalViewControllerAnimated:YES];
            return NO;
        }
    }
return YES;
}


#pragma mark - Notify

/**
 Braodcast notification on successful auth.
 **/
- (void)notifyWithObject:(id)userInfo andName:(NSString *)name
{
    [[NSNotificationCenter defaultCenter] postNotificationName:name object:self userInfo:userInfo];
}

@end
