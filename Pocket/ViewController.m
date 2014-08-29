//
//  ViewController.m
//  Pocket
//
//  Created by 杜長城 on 8/21/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "TimelineViewController.h"


@interface ViewController ()

@end

@implementation ViewController

// below two functions are necessary for table cell present
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [journeyList count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *indicator = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indicator];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indicator];
    }
    
    cell.textLabel.text = [[journeyList objectAtIndex:indexPath.row] objectAtIndex:1];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // if user is on this journey: 1==yes  0==not
    NSLog([[journeyList objectAtIndex:indexPath.row] objectAtIndex:8]);
    
    // variables for checking journey state
    NSNumber *traveling = [[journeyList objectAtIndex:indexPath.row] objectAtIndex:8];
    NSNumber *yes = [NSNumber numberWithInteger: 1];
    NSInteger travelingCheck = [traveling integerValue];
    NSInteger yesCheck = [yes integerValue];
    
    TimelineViewController *timelineViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"TimelineViewController"];
    BOOL *journeyOnGoing;
    
    //do camera action from the first row to the last row in the tableview
    if (indexPath.row > -1)
	{
        // check if user is on journey
        if (travelingCheck==yesCheck) {
            journeyOnGoing = YES;
            [self performSegueWithIdentifier:@"showRecord" sender:self];
        } else{
            journeyOnGoing = NO;
            [self performSegueWithIdentifier:@"showJourney" sender:self];
        }

    }
    [timelineViewController setJourneyState:journeyOnGoing];
    

}


- (void)viewDidLoad
{
    //initial a notification for reload tableview function
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(ReloadDataFunction:)
                                                 name:@"refresh"
                                               object:nil];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    journeyList = [[NSMutableArray alloc] init]; //List all journey on Pocket page
    
    
    // 取得已開啓的資料庫連線變數
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    sqlite3 *db = [delegate getDB];
    
    if (db != nil) {
        // 準備好查詢的SQL command
        const char *sql = "SELECT * FROM journey";
        // statement用來儲存執行結果
        sqlite3_stmt *statement;
        sqlite3_prepare(db, sql, -1, &statement, NULL);
        
        // 利用迴圈取出查詢結果
        while (sqlite3_step(statement) == SQLITE_ROW) {
            char *iid = (char *)sqlite3_column_text(statement, 0);
            char *name = (char *)sqlite3_column_text(statement, 1);
            char *country = (char *)sqlite3_column_text(statement, 2);
            char *city = (char *)sqlite3_column_text(statement, 3);
            char *start = (char *)sqlite3_column_text(statement, 4);
            char *end = (char *)sqlite3_column_text(statement, 5);
            char *description = (char *)sqlite3_column_text(statement, 6);
            char *profilepic = (char *)sqlite3_column_text(statement, 7);
            char *traveling = (char *)sqlite3_column_text(statement, 8);
            
            journeyInfo = [[NSMutableArray alloc] init];
            [journeyInfo addObject:[NSString stringWithFormat:@"%s", iid, nil]];
            [journeyInfo addObject:[NSString stringWithFormat:@"%s", name, nil]];
            [journeyInfo addObject:[NSString stringWithFormat:@"%s", country, nil]];
            [journeyInfo addObject:[NSString stringWithFormat:@"%s", city, nil]];
            [journeyInfo addObject:[NSString stringWithFormat:@"%s", start, nil]];
            [journeyInfo addObject:[NSString stringWithFormat:@"%s", end, nil]];
            [journeyInfo addObject:[NSString stringWithFormat:@"%s", description, nil]];
            [journeyInfo addObject:[NSString stringWithFormat:@"%s", profilepic, nil]];
            [journeyInfo addObject:[NSString stringWithFormat:@"%s", traveling, nil]];
            
            [journeyList addObject:journeyInfo];
            
            // for test database
            // NSLog(@"id: %@", [NSString stringWithCString:id encoding:NSUTF8StringEncoding]);
            // NSLog(@"name: %@", [NSString stringWithCString:name encoding:NSUTF8StringEncoding]);
        }
        // NSLog([journeyList objectAtIndex:2]);
        
        sqlite3_finalize(statement);
    }

}

// implement a reload tableview function
-(void)ReloadDataFunction:(NSNotification *)notification {
    
    // 取得已開啓的資料庫連線變數
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    sqlite3 *db = [delegate getDB];
    
    if (db != nil) {
        // 準備好查詢的SQL command
        const char *sql = "SELECT * FROM journey";
        // statement用來儲存執行結果
        sqlite3_stmt *statement;
        sqlite3_prepare(db, sql, -1, &statement, NULL);
        [journeyList removeAllObjects];
       
        // 利用迴圈取出查詢結果
        while (sqlite3_step(statement) == SQLITE_ROW) {
            char *iid = (char *)sqlite3_column_text(statement, 0);
            char *name = (char *)sqlite3_column_text(statement, 1);
            char *country = (char *)sqlite3_column_text(statement, 2);
            char *city = (char *)sqlite3_column_text(statement, 3);
            char *start = (char *)sqlite3_column_text(statement, 4);
            char *end = (char *)sqlite3_column_text(statement, 5);
            char *description = (char *)sqlite3_column_text(statement, 6);
            char *profilepic = (char *)sqlite3_column_text(statement, 7);
            char *traveling = (char *)sqlite3_column_text(statement, 8);
            
            journeyInfo = [[NSMutableArray alloc] init];
            [journeyInfo addObject:[NSString stringWithFormat:@"%s", iid, nil]];
            [journeyInfo addObject:[NSString stringWithFormat:@"%s", name, nil]];
            [journeyInfo addObject:[NSString stringWithFormat:@"%s", country, nil]];
            [journeyInfo addObject:[NSString stringWithFormat:@"%s", city, nil]];
            [journeyInfo addObject:[NSString stringWithFormat:@"%s", start, nil]];
            [journeyInfo addObject:[NSString stringWithFormat:@"%s", end, nil]];
            [journeyInfo addObject:[NSString stringWithFormat:@"%s", description, nil]];
            [journeyInfo addObject:[NSString stringWithFormat:@"%s", profilepic, nil]];
            [journeyInfo addObject:[NSString stringWithFormat:@"%s", traveling, nil]];
            
            [journeyList addObject:journeyInfo];
        }
        
        sqlite3_finalize(statement);
    }
    
    NSLog(@"reload");
    // 用迴圈取得位於ViewController上的每一個UIView類別
    for (UIView *view in self.view.subviews) {
        // 判斷取得的view是否屬於UITableView類別
        if ([view isKindOfClass:[UITableView class]]) {
            // 如果是就強制轉型為UITableView
            UITableView *tableView = (UITableView *)view;
            // 要求重新載入資料
            [tableView reloadData];
            break;
        }
    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
