//
//  ArticleDetailTableViewController.h
//  DigitalHealth
//
//  Created by Daniel Ruiz on 22/05/14.
//  Copyright (c) 2014 Axa. All rights reserved.
//


@class ArticleDetailViewController;

@interface ArticleDetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) PFObject *articleEntity;

@end
