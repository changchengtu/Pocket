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

- (void) setJourneyState:(BOOL *)state {
    
    if (state) {
        NSLog(@"on the journey");
    } else{
        NSLog(@"not on the journey");
    }
    
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
