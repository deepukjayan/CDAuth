//
//  CDAuth.h
//  CDAuth
//
//  Created by Deepak K on 17/05/13.
//  Copyright (c) 2013 codeWithDeepu. All rights reserved.
//


/**
 After completing the auth procress, method "- (void)authDone:(NSDictionary *)userInfo" will be called upon your viewcontroller. userInfo is the dictionary with all available data.
 
 CDAuth have implemented nothing to handle error and currently only supports Foursquare. We will update it with more services and handle errors properly.
 **/



#import <Foundation/Foundation.h>

@interface CDAuth : NSObject

-(void)authenticateFoursquareWithClientId:(NSString *)clientId andRedirectUri:(NSString *)redirectUri fromView:(UIViewController *)baseView;

@end
