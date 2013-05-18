//
//  CDAuthBrowserViewController.h
//  CDAuth
//
//  Created by Deepak K on 17/05/13.
//  Copyright (c) 2013 codeWithDeepu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    FS,
    FB,
    TW
} CDAuthType ;


@interface CDAuthBrowserViewController : UIViewController<UIWebViewDelegate>

@property (strong, nonatomic) IBOutlet UIWebView *browser;
@property (strong, nonatomic) NSString *redirectUri;
@property (assign, nonatomic) CDAuthType authType;
@property (strong, nonatomic) NSString *clientId;
@property (strong, nonatomic) NSString *authUri;


@end
