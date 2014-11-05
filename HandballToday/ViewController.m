//
//  ViewController.m
//  HandballToday
//
//  Created by Roger Gras on 5/11/14.
//  Copyright (c) 2014 rogras. All rights reserved.
//

#import "ViewController.h"
#import "StoryBoardStaticFactory.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [self performSelector:@selector(showNextScreen) withObject:nil afterDelay:2.0f];
}


- (void)showNextScreen
{
    /*
    if ([WSLogin openLoginIfNeeded])
        return;
    */
    UIStoryboard *storyboard = [StoryBoardStaticFactory storyBoardForMenu];
    UIViewController *vc = [storyboard instantiateInitialViewController];
    [self presentViewController:vc animated:YES completion:nil];
    
    /*
     Enable HockeyApp
     IMPORTANT: If your app shows a modal view on startup, make sure to call authenticateInstallation either once your modal view is fully presented (e.g. its viewDidLoad: method is processed) or once your modal view is dismissed.
     */
    /*
     [[BITHockeyManager sharedHockeyManager] configureWithIdentifier:@"d18f90da2eac17ce933ea98bbd2dedbd"];
     [[BITHockeyManager sharedHockeyManager] startManager];
     [[BITHockeyManager sharedHockeyManager].authenticator authenticateInstallation];
     */
}


@end
