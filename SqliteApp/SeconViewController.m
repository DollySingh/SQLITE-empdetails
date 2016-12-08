//
//  SeconViewController.m
//  SqliteApp
//
//  Created by Felix-Madhuri on 14/10/16.
//  Copyright © 2016 Felix-Madhuri. All rights reserved.
//

#import "SeconViewController.h"
#import <sqlite3.h>

@interface SeconViewController ()

@end

@implementation SeconViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)save:(id)sender {
    
    NSArray *dir=  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dbpath=[NSString stringWithFormat:@"%@/Mydb.sqlite",[dir lastObject]];
    
    sqlite3 *db;
    
    if( sqlite3_open([dbpath UTF8String], &db)==SQLITE_OK)
    {
        
        NSString *insertquery=[NSString stringWithFormat:@"insert into employee values(\"%@\",\"%@\",\"%@\",\"%@\")",_empidtf.text,_empnametf.text,_empaddresstf.text,_empphonetf.text];
        
        NSLog(@"%@",insertquery);
        
        if(sqlite3_exec(db,[insertquery UTF8String],NULL,NULL,NULL)==SQLITE_OK)
        {
            NSLog(@"record inserted");
        }
        else
        {
            NSLog(@"fail to insert record");
        }
        
    }

    
    sqlite3_close(db);
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
