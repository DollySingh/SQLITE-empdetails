//
//  FirstTableViewController.m
//  SqliteApp
//
//  Created by Felix-Madhuri on 14/10/16.
//  Copyright © 2016 Felix-Madhuri. All rights reserved.
//

#import "FirstTableViewController.h"
#import <sqlite3.h>

@interface FirstTableViewController ()

@end

@implementation FirstTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _emparray=[[NSMutableArray alloc]init];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [_emparray removeAllObjects];
    
    NSArray *dir=  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *dbpath=[NSString stringWithFormat:@"%@/Mydb.sqlite",[dir lastObject]];
    
    sqlite3 *db;
    
    sqlite3_stmt *mystmt;
    
    if( sqlite3_open([dbpath UTF8String], &db)==SQLITE_OK)
    {
       const char * query="select * from employee";
        
        if(sqlite3_prepare(db, query, -1, &mystmt, NULL)==SQLITE_OK)
        {
            while (sqlite3_step(mystmt)==SQLITE_ROW) {
                
              
                NSString *temp=[ NSString stringWithFormat:@"%s",sqlite3_column_text(mystmt,1)];
                                                                                     
                [_emparray addObject:temp];
            }
            
        }
        else
        {
            NSLog(@"fail to execute query");
        }
    
    }
    
    sqlite3_close(db);
    [self.tableView reloadData];
    
        
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return _emparray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    cell.textLabel.text=[_emparray objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"fvctotvc" sender:self];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
