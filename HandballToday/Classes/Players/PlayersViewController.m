//
//  HomeViewController.m
//  HandballToday
//
//  Created by Roger Gras on 5/11/14.
//  Copyright (c) 2014 rogras. All rights reserved.
//

#import "PlayersViewController.h"
#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"
#import "AppDelegate.h"
#import "StoryBoardStaticFactory.h"
#import "ArticleDetailViewController.h"
#import "InfoCell.h"
#define kNumArticlesInHeader    3

@interface PlayersViewController ()
{
    AppDelegate *_appDelegate;
    CLLocationManager *_locationManager;
    NSArray *listTeamNews;
}



@end

@implementation PlayersViewController

// *****************************************************************************
#pragma mark -                                          ViewController Lifecycle
// *****************************************************************************
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self localizeLabels];
    [self makeView];
    
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [self loadTeamNews];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

// *****************************************************************************
#pragma mark -                                          Target Actions
// *****************************************************************************
- (IBAction)doShowSideMenu:(id)sender
{
    [self.sidePanelController showLeftPanelAnimated:TRUE];
}


// *****************************************************************************
#pragma mark -                                         Private Helper Methods
// *****************************************************************************
- (void)localizeLabels
{
    
}

- (void)makeView
{
    //self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"axa_logo_top.png"]];
    UIImageView *titleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"axa_square_rvb.png"]];
    titleImageView.frame = CGRectMake(245-11, 11, 22, 22);
    titleImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    [titleView addSubview:titleImageView];
    
    self.navigationItem.titleView = titleView;
    
    self.pagedScrollView.playersPagedScrollDelegate = self;
    
}

- (void)pushVC:(UIViewController *)vc
{
        [self.navigationController pushViewController:vc animated:YES];
}

// *****************************************************************************
#pragma mark -                                         HomePagedNewsDelegate
// *****************************************************************************

- (void)playersPagedScroll:(PlayersPagedScroll *)playersPagedScroll
          didScrollToIndex:(NSInteger)index
{
    self.headerPageControl.currentPage = index;
    PFObject *news = listTeamNews[index];
    self.lblName.text = news[@"message"];
}


- (void)playersPagedScrollDidTapOnCurrentElement:(PlayersPagedScroll *)homePagedNews
{
    
    NSInteger selectedIndex = self.headerPageControl.currentPage;
    PFObject *selectedArticle = listTeamNews[selectedIndex];
    if (selectedArticle)
    {
        
       
    }
    
}


- (void)_displayArticles
{
    [self.pagedScrollView clearSubviews];
    self.headerPageControl.numberOfPages = 0;
    
    if (listTeamNews.count) {
        
        PFObject *news = listTeamNews[0];
        self.lblName.text = news[@"title"];
        
        NSInteger addedArticles = 0;
        for (PFObject *newsObject in listTeamNews) {
            
            PFFile *theImage = [newsObject objectForKey:@"image"];
            NSData *imageData = [theImage getData];
            UIImage *image = [UIImage imageNamed:@"profile"];
            
            [self.pagedScrollView addImage:image];
            self.headerPageControl.numberOfPages += 1;
            addedArticles += 1;
            if (addedArticles == kNumArticlesInHeader) {
                break;
            }
        }
        
    }
    else {
        [self _displayNoArticles];
    }
}

- (void)_displayNoArticles
{
    self.lblName.text = @"";
    [self.pagedScrollView clearSubviews];
    self.headerPageControl.numberOfPages = 0;
    
    [self.pagedScrollView addImage:[UIImage imageNamed:@"home_news_default.png"]];
    self.headerPageControl.numberOfPages += 1;
}

-(void) loadTeamNews
{
    PFQuery *query = [PFQuery queryWithClassName:@"News"];
    [query orderByAscending:@"updatedAt"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // Do something with the found objects
            listTeamNews = [[NSArray alloc] initWithArray:objects];
            [self _displayArticles];
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
            [self _displayNoArticles];
        }
    }];
}

#pragma mark - UITableViewDataSource


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)table cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    InfoCell *cell = [table dequeueReusableCellWithIdentifier:@"InfoCell" forIndexPath:indexPath];
    
    return cell;
}

@end
