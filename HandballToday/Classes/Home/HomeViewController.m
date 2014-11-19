//
//  HomeViewController.m
//  HandballToday
//
//  Created by Roger Gras on 5/11/14.
//  Copyright (c) 2014 rogras. All rights reserved.
//

#import "HomeViewController.h"
#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"
#import "AppDelegate.h"
#import "StoryBoardStaticFactory.h"

#define kNumArticlesInHeader    3

@interface HomeViewController ()
{
    AppDelegate *_appDelegate;
    CLLocationManager *_locationManager;
    NSArray *listTeamNews;
}



@end

@implementation HomeViewController

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
    
    /*
     NSPredicate *predicate = [NSPredicate predicateWithFormat:
     @"objectId = %@", team.objectId];
     
     PFQuery *query = [PFQuery queryWithClassName:@"Teams" predicate:predicate];
     [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
     if (!error) {
     // The find succeeded.
     NSLog(@"Successfully retrieved %lu scores.", (unsigned long)objects.count);
     // Do something with the found objects
     for (PFObject *object in objects) {
     NSLog(@"%@", object.objectId);
     }
     
     } else {
     // Log details of the failure
     NSLog(@"Error: %@ %@", error, [error userInfo]);
     }
     }];
     */
    
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

- (IBAction)doShowProfile:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Players" bundle:nil];
    
    //If profile exists goto directly to profile
    UIViewController *vc;
    
    
    [self pushVC:vc];
}

- (IBAction)doShowAppointments:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Calendar" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"appointments"];
    
    [self pushVC:vc];
}

- (IBAction)doShowEmergency:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"News" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"emergency"];
    
    [self pushVC:vc];
}




// *****************************************************************************
#pragma mark -                                         Private Helper Methods
// *****************************************************************************
- (void)localizeLabels
{
    self.lblHealthProfile.text  = NSLocalizedString(@"home_btn_players", Nil);
    self.lblAppointment.text    = NSLocalizedString(@"home_btn_calendar", Nil);
    self.lblEmergency.text      = NSLocalizedString(@"home_btn_more_news", Nil);
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
    
    [self.btnHealthProfile.titleLabel setTextAlignment: NSTextAlignmentCenter];
    [self.btnAppointment.titleLabel setTextAlignment: NSTextAlignmentCenter];
    [self.btnEmergency.titleLabel setTextAlignment: NSTextAlignmentCenter];
    
    self.pagedScrollView.homePagedNewsDelegate = self;
    
}

- (void)pushVC:(UIViewController *)vc
{
        [self.navigationController pushViewController:vc animated:YES];
}

// *****************************************************************************
#pragma mark -                                         HomePagedNewsDelegate
// *****************************************************************************

- (void)homePagedNews:(HomePagedNews *)homePagedNews
     didScrollToIndex:(NSInteger)index
{
    self.headerPageControl.currentPage = index;
    PFObject *news = listTeamNews[index];
    self.headerTitleLabel.text = news[@"message"];
    self.headerTopicLabel.text = news[@"title"];
}


- (void)homePagedNewsDidTapOnCurrentElement:(HomePagedNews *)homePagedNews
{
    
    NSInteger selectedIndex = self.headerPageControl.currentPage;
    PFObject *selectedArticle = listTeamNews[selectedIndex];
    if (selectedArticle)
    {
        
        [self _gotoArticleDetail:selectedArticle];
    }
    
}


- (void)_displayArticles
{
    [self.pagedScrollView clearSubviews];
    self.headerPageControl.numberOfPages = 0;
    
    if (listTeamNews.count) {
        
        PFObject *news = listTeamNews[0];
        self.headerTitleLabel.text = news[@"message"];
        self.headerTopicLabel.text = news[@"title"];
        
        NSInteger addedArticles = 0;
        for (PFObject *newsObject in listTeamNews) {
            
            PFFile *theImage = [newsObject objectForKey:@"image"];
            NSData *imageData = [theImage getData];
            UIImage *image = [UIImage imageWithData:imageData];
            
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
    self.headerTopicLabel.text = @"";
    self.headerTitleLabel.text = @"";
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

- (void)_gotoArticleDetail:(ArticleEntity *)articleEntity
{
    if (!articleEntity) {
        return;
    }
    
    UIStoryboard *storyboard = [StoryBoardStaticFactory storyBoardForNews];
    UIViewController *vc = [storyboard instantiateInitialViewControllerForNews];
    
    [self pushVC:vc];
    
 
}

@end
