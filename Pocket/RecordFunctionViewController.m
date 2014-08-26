//
//  RecordFunctionViewController.m
//  Pocket
//
//  Created by Bocard on 2014/8/25.
//  Copyright (c) 2014年 Bocard. All rights reserved.
//

#import "RecordFunctionViewController.h"


@interface RecordFunctionViewController ()

@end

@implementation RecordFunctionViewController

- (IBAction)takePhoto
{
    // Create image picker controller
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    // Set source to the camera
    imagePicker.sourceType =  UIImagePickerControllerSourceTypeCamera;
    imagePicker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType: UIImagePickerControllerSourceTypeCamera];
    // Delegate is self
    //imagePicker.delegate = self;
    
    // Allow editing of image ?
    imagePicker.allowsEditing = NO;
    
    // Show image picker
    [self presentViewController:imagePicker animated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //UIImage *image = info[UIImagePickerControllerEditedImage];
    //NSData *data = UIImageJPEGRepresentation(image, 1.0);
    
    // Here we can get the URL of the image for db to store or retrieve
    //NSURL* localUrl = (NSURL *)[info valueForKey:UIImagePickerControllerReferenceURL];
    
    // Here we can get the URL of the vide for db to store or retrieve
    self.videoURL = info[UIImagePickerControllerMediaURL];
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
    self.videoController = [[MPMoviePlayerController alloc] init];
    
    [self.videoController setContentURL:self.videoURL];
    [self.videoController.view setFrame:CGRectMake (0, 0, 320, 460)];
    [self.view addSubview:self.videoController.view];
    
    [self.videoController play];
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)videoPlayBackDidFinish:(NSNotification *)notification {
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    
    // Stop the video player and remove it from view
    [self.videoController stop];
    [self.videoController.view removeFromSuperview];
    self.videoController = nil;
    
    // Display a message
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Video Playback" message:@"Just finished the video playback. The video is now removed." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
