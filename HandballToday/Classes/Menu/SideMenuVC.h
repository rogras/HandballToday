//
//  SideMenuVC.h
//  Digital Health
//
//  Created by Raúl Blánquez on 22/04/14.
//  Copyright (c) 2014 Axa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SideMenuVC : UITableViewController

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *topButtons;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *topLabels;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *topIcons;


@end
