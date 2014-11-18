//
//  SidePanelVC.m
//  HandballToday
//
//  Created by Roger Gras on 5/11/14.
//  Copyright (c) 2014 rogras. All rights reserved.
//

#import "SidePanelVC.h"
#import "SideMenuVC.h"
#import "HomeViewController.h"

@interface SidePanelVC ()

@end

@implementation SidePanelVC

// *****************************************************************************
#pragma mark -                                          ViewController Lifecycle
// *****************************************************************************
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UINavigationController *sideMenuNavBar = [self.storyboard instantiateViewControllerWithIdentifier:@"sideMenuNav"];
    SideMenuVC *menuVC = (SideMenuVC *)sideMenuNavBar.topViewController;
    
    [self setLeftPanel:sideMenuNavBar];
    //self.defaultImage = [UIImage imageNamed:@"ic_menu_drawer"];
    
    //El side panel genera un cambio de estado relativo a la visibilidad
    [self addObserver:menuVC forKeyPath:@"state" options:NSKeyValueObservingOptionNew context:Nil];
    
    HomeViewController *homeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"home"];
    
    //Set central panel: con o sin navigation controller
    [self setCenterPanel:[[UINavigationController alloc] initWithRootViewController:homeVC]];
    
    [[[UIApplication sharedApplication] keyWindow] setRootViewController:self];

    
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

//Need to override this to avoid rounding corners
- (void)stylePanel:(UIView *)panel
{
    panel.layer.cornerRadius = 0.0;
}

@end
