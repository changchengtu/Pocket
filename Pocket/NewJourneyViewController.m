//
//  NewJourneyViewController.m
//  Pocket
//
//  Created by 杜長城 on 8/24/14.
//  Copyright (c) 2014 杜長城. All rights reserved.
//

#import "NewJourneyViewController.h"

@interface NewJourneyViewController ()

@end

@implementation NewJourneyViewController

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//for the cancel button
- (IBAction)cancelReturnToFirstPage:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{}];
}

//for the Done button
- (IBAction)doneReturnToFirstPage:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{}];


}

@end
