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
@synthesize journeyName;
@synthesize journeyLocation;

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
    
    journeyDetail = [[NSMutableDictionary alloc] init]; //initialized
    
    
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

    //for test
    NSLog(journeyDetail[@"name"]);
    NSLog(journeyDetail[@"location"]);
    
    
    // 取得已開啓的資料庫連線變數
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    sqlite3 *db = [delegate getDB];
    if (db != nil) {
        // 準備好插入資料的SQL command
        NSString *queryString = [NSString stringWithFormat:@"INSERT INTO journey VALUES ( NULL, '%@','%@',NULL, NULL)", journeyDetail[@"name"], journeyDetail[@"location"]];
        const char *sql = [queryString UTF8String];

        sqlite3_stmt *statement;
        // 執行
        sqlite3_prepare(db, sql, -1, &statement, NULL);
        
        // 檢查插入資料是否成功
        if (sqlite3_step(statement) == SQLITE_DONE) {
            NSLog(@"成功插入一筆資料");
        } else {
            NSLog(@"插入一筆資料失敗");
        }
        
        // 使用完畢，釋放statement
        sqlite3_finalize(statement);
    }
    [self dismissViewControllerAnimated:YES completion:^{}];
}


// for saving name of journey
- (IBAction)nameDoneEditing:(id)sender {
    [journeyDetail setObject:self.journeyName.text forKey:@"name"];
}

//for saving location of journey
- (IBAction)locationDoneEditing:(id)sender {
    [journeyDetail setObject:self.journeyLocation.text forKey:@"location"];
}


@end
