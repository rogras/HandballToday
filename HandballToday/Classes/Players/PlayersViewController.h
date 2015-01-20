//
//  HomeViewController.h
//  HandballToday
//
//  Created by Roger Gras on 5/11/14.
//  Copyright (c) 2014 rogras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayersPagedScroll.h"

@interface PlayersViewController : UIViewController<PlayersPagedScrollDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIView *headerCaptionContainer;
@property (weak, nonatomic) IBOutlet UIPageControl *headerPageControl;
@property (strong, nonatomic) NSArray *articlesToDisplay;
@property (weak, nonatomic) IBOutlet PlayersPagedScroll *pagedScrollView;

@property (weak, nonatomic) IBOutlet UILabel *lblName;

@property (weak, nonatomic) IBOutlet UITableView *tablePlayerInfo;

@end
