//
//  ViewController.m
//  Pocket
//
//  Created by 杜長城 on 8/21/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"


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
    
    cell.textLabel.text = [journeyList objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //do camera action from the first row to the last row in the tableview
    if (indexPath.row > -1)
	{
		//do actions
		UIImagePickerController *imgpicker = [[UIImagePickerController alloc] init];
		
		// Set the image picker source to the camera:
		imgpicker.sourceType = UIImagePickerControllerSourceTypeCamera;
		imgpicker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType: UIImagePickerControllerSourceTypeCamera];
		// Hide the camera controls:
		//imgpicker.showsCameraControls = YES;
		//imgpicker.navigationBarHidden = NO;
		// Allow editing of image ?
        imgpicker.allowsEditing = NO;
        
        // Show image picker
        [self presentViewController:imgpicker animated:YES completion:NULL];
		// Make the view full screen:
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
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
            char *id = (char *)sqlite3_column_text(statement, 0);
            char *name = (char *)sqlite3_column_text(statement, 1);
            [journeyList addObject:[NSString stringWithFormat:@"%s", name, nil]];
            NSLog(@"id: %@", [NSString stringWithCString:id encoding:NSUTF8StringEncoding]);
            NSLog(@"name: %@", [NSString stringWithCString:name encoding:NSUTF8StringEncoding]);
        }
        
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
        
        // 利用迴圈取出查詢結果
        while (sqlite3_step(statement) == SQLITE_ROW) {
            char *id = (char *)sqlite3_column_text(statement, 0);
            char *name = (char *)sqlite3_column_text(statement, 1);
            [journeyList addObject:[NSString stringWithFormat:@"%s", name, nil]];
            NSLog(@"id: %@", [NSString stringWithCString:id encoding:NSUTF8StringEncoding]);
            NSLog(@"name: %@", [NSString stringWithCString:name encoding:NSUTF8StringEncoding]);
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
