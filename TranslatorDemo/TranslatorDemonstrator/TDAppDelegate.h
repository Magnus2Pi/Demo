//
//  TDAppDelegate.h
//  TranslatorDemonstrator
//
//  Created by Magnus Løberg on 24.04.12.
//  Copyright (c) 2012 UiB. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TDViewController;

@interface TDAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) TDViewController *viewController;

@end
