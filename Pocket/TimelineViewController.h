//
//  TimelineViewController.h
//  Pocket
//
//  Created by 杜長城 on 8/28/14.
//  Copyright (c) 2014 杜長城. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimelineViewController : UIViewController<UINavigationBarDelegate, UIImagePickerControllerDelegate>
{
    bool *onJourney;
}
- (void) setJourneyState:(BOOL *)state;

@end
