//
//  SideMenuVC.h
//  HandballToday
//
//  Created by Roger Gras on 5/11/14.
//  Copyright (c) 2014 rogras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SideMenuVC : UITableViewController

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *topButtons;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *topLabels;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *topIcons;


@end
