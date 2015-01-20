//
//  KpiCell.h
//  Personal Dashboard
//
//  Created by mobdev1 on 18/02/14.
//  Copyright (c) 2014 mobdev1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KPI.h"


@interface InfoCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *valueLabel;
@property (weak, nonatomic) IBOutlet UILabel *recommendedLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UIButton *moreButton;

@end
