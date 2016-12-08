//
//  ThirdViewController.h
//  SqliteApp
//
//  Created by Felix-Madhuri on 14/10/16.
//  Copyright © 2016 Felix-Madhuri. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdViewController : UIViewController



@property (weak, nonatomic) IBOutlet UITextField *empidtf;


@property (weak, nonatomic) IBOutlet UITextField *empnametf;


@property (weak, nonatomic) IBOutlet UITextField *empaddresstf;


@property (weak, nonatomic) IBOutlet UITextField *empphonrtf;



- (IBAction)find:(id)sender;

- (IBAction)update:(id)sender;

- (IBAction)deleterecord:(id)sender;




@end
