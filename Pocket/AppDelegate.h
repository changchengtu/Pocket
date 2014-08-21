//
//  AppDelegate.h
//  Pocket
//
//  Created by 杜長城 on 8/21/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    sqlite3 *db;
}
-(sqlite3 *)getDB;

@property (strong, nonatomic) UIWindow *window;

@end
