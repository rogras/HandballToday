//
//  MenuCell.h
//  Digital Health
//
//  Created by mobdev1 on 23/04/14.
//  Copyright (c) 2014 Axa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgIcon;
@property (weak, nonatomic) IBOutlet UILabel *lblMenuItem;
@property (weak, nonatomic) IBOutlet UIView *separator;

@property (strong, nonatomic) NSString *storyboard;
@property (strong, nonatomic) UIViewController *viewController;

@end
