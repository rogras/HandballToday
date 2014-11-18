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

#define kNumArticlesInHeader    3

@interface HomeViewController ()
{
    AppDelegate *_appDelegate;
    CLLocationManager *_locationManager;
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
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Profile" bundle:nil];
    
    //If profile exists goto directly to profile
    UIViewController *vc;
    
    
    [self pushVC:vc];
}

- (IBAction)doShowAppointments:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Appointments" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"appointments"];
    
    [self pushVC:vc];
}

- (IBAction)doShowEmergency:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Emergency" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"emergency"];
    
    [self pushVC:vc];
}




// *****************************************************************************
#pragma mark -                                         Private Helper Methods
// *****************************************************************************
- (void)localizeLabels
{
    self.lblHealthProfile.text  = NSLocalizedString(@"home_btn_profile", Nil);
    self.lblAppointment.text    = NSLocalizedString(@"home_btn_appointment", Nil);
    self.lblEmergency.text      = NSLocalizedString(@"home_btn_emergency", Nil);
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
    
}

- (void)pushVC:(UIViewController *)vc
{
        [self.navigationController pushViewController:vc animated:YES];
}



@end
