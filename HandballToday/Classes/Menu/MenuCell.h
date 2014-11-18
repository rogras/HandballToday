//
//  MenuCell.h
//  HandballToday
//
//  Created by Roger Gras on 5/11/14.
//  Copyright (c) 2014 rogras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgIcon;
@property (weak, nonatomic) IBOutlet UILabel *lblMenuItem;
@property (weak, nonatomic) IBOutlet UIView *separator;

@property (strong, nonatomic) NSString *storyboard;
@property (strong, nonatomic) UIViewController *viewController;

@end
