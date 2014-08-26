//
//  RecordFunctionViewController.h
//  Pocket
//
//  Created by Bocard on 2014/8/25.
//  Copyright (c) 2014年 Bocard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface RecordFunctionViewController : UIViewController

@property (strong, nonatomic) NSURL *videoURL;
@property (strong, nonatomic) MPMoviePlayerController *videoController;

@end
