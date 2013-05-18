//
//  CDAuth.m
//  CDAuth
//
//  Created by Deepak K on 17/05/13.
//  Copyright (c) 2013 codeWithDeepu. All rights reserved.
//  

#import "CDAuth.h"
#import "CDAuthBrowserViewController.h"

@implementation CDAuth

- (id)init
{
    self = [super init];
    if (self) {

    }
    return self;
}

/**
 To obtain authToken for foursquare.
 **/

-(void)authenticateFoursquareWithClientId:(NSString *)clientId andRedirectUri:(NSString *)redirectUri fromView:(UIViewController *)baseView
{
    CDAuthBrowserViewController *authBrowser = [[CDAuthBrowserViewController alloc]initWithNibName:@"CDAuthBrowserViewController" bundle:Nil];
    authBrowser.redirectUri = redirectUri;
    authBrowser.clientId = clientId;
    authBrowser.authUri = [NSString stringWithFormat:@"https://foursquare.com/oauth2/authenticate?client_id=%@&response_type=code&redirect_uri=%@", clientId, redirectUri];
    authBrowser.authType = FS;

    [[NSNotificationCenter defaultCenter] addObserver:baseView selector:@selector(authDone:)name:@"authDone" object:nil];
    
    [baseView presentModalViewController:authBrowser animated:YES];
    
}



@end
