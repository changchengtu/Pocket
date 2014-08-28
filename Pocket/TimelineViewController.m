//
//  TimelineViewController.m
//  Pocket
//
//  Created by 杜長城 on 8/28/14.
//  Copyright (c) 2014 杜長城. All rights reserved.
//

#import "TimelineViewController.h"

@interface TimelineViewController ()

@end

@implementation TimelineViewController


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
    // Do any additional setup after loading the view.

    
    //do actions
    UIImagePickerController *imgpicker = [[UIImagePickerController alloc] init];
    
    // Set the image picker source to the camera:
    imgpicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    imgpicker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType: UIImagePickerControllerSourceTypeCamera];
    
    //杜長城（書本新增），為了啟動下面imagePickerController
    imgpicker.delegate = self;
    // Hide the camera controls:
    //imgpicker.showsCameraControls = YES;
    //imgpicker.navigationBarHidden = NO;
    // Allow editing of image ?
    imgpicker.allowsEditing = NO;
    
    // Show image picker
    [self presentViewController:imgpicker animated:YES completion:NULL];
    // Make the view full screen:
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // 取得使用者拍攝的照片
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    // 存檔
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    // 關閉拍照程式
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showMessage:(id)sender {
    NSLog(@"this is");
}
- (IBAction)doReturn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{}];
    NSLog(@"RETURN");
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
