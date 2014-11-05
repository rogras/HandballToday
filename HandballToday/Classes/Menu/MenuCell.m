//
//  MenuCell.m
//  Digital Health
//
//  Created by mobdev1 on 23/04/14.
//  Copyright (c) 2014 Axa. All rights reserved.
//

#import "MenuCell.h"


@implementation MenuCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // self.backgroundColor = selected ? [UIColor whiteColor] : [UIColor clearColor];
}


- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    // self.backgroundColor = highlighted ? [UIColor whiteColor] : [UIColor clearColor];
}

@end
