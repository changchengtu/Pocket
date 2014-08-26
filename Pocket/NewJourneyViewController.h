//
//  NewJourneyViewController.h
//  Pocket
//
//  Created by 杜長城 on 8/24/14.
//  Copyright (c) 2014 杜長城. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface NewJourneyViewController : ViewController
{
    NSMutableDictionary *journeyDetail;// for saving data from user entered about journey
}
@property (strong, nonatomic) IBOutlet UITextField *journeyName;
@property (strong, nonatomic) IBOutlet UITextField *journeyLocation;
@end
