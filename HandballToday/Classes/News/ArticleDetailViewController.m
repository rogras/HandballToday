//
//  ArticleDetailTableViewController.m
//  DigitalHealth
//
//  Created by Daniel Ruiz on 22/05/14.
//  Copyright (c) 2014 Axa. All rights reserved.
//

#import "ArticleDetailViewController.h"

@interface ArticleDetailViewController ()


@property (weak, nonatomic) IBOutlet UIImageView *articleImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *bodyText;

@end

@implementation ArticleDetailViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupSubiews];
    
    [self _displayArticle:self.articleEntity];
    
}

- (void)setupSubiews
{
    
    self.articleImageView.clipsToBounds = YES;
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(doShare:)];
    self.navigationItem.rightBarButtonItem = barButtonItem;
    
}


#pragma mark - Public methods

- (void)doShare:(id)sender
{
    
}

#pragma mark - Private methods

- (void)_displayArticle:(PFObject *)articleEntity
{
    if (!articleEntity) {
        return;
    }
    
    self.title = articleEntity[@"title"];
    
        PFFile *theImage = [articleEntity objectForKey:@"image"];
        NSData *imageData = [theImage getData];
        UIImage *image = [UIImage imageWithData:imageData];
        
        self.articleImageView.image = image;
    
    self.titleLabel.text = articleEntity[@"title"];
    self.bodyText.text = articleEntity[@"message"];
    
}

@end
