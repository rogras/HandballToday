//
//  SideMenuVC.m
//  HandballToday
//
//  Created by Roger Gras on 5/11/14.
//  Copyright (c) 2014 rogras. All rights reserved.
//

#import "SideMenuVC.h"
#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"
#import "MenuCell.h"


@implementation SideMenuVC

#pragma mark - UIViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"slide-menu-bg.png"]];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}


#pragma mark - Private


- (UIViewController *)initialViewController
{
    static UIViewController *initialViewController;
    if (!initialViewController) {
        //initialViewController = [[UINavigationController alloc] initWithRootViewController:[[CustomTabBarController alloc] init]];
    }
    return initialViewController;
}


#pragma mark - JASidePanelController


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"state"]) {
        JASidePanelState status = [[object valueForKeyPath:keyPath] intValue];
        
        switch (status) {
            case JASidePanelCenterVisible:
                break;
            case JASidePanelLeftVisible:
                [self.tableView reloadData];
                break;
            default:
                break;
        }
    }
}


#pragma mark - UITableViewDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"menuCell";

    MenuCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (indexPath.row == 0){
        cell.lblMenuItem.text = NSLocalizedString(@"sidemenu_home", nil);
        cell.viewController = [self initialViewController];
        cell.imgIcon.image = [UIImage imageNamed:@"slide-menu-icon-home"];
    } else if (indexPath.row == 1) {
        cell.lblMenuItem.text = NSLocalizedString(@"sidemenu_profile", nil);
        cell.storyboard = @"Profile";
        cell.imgIcon.image = [UIImage imageNamed:@"slide-menu-icon-profile"];
    } else if (indexPath.row == 2) {
        cell.lblMenuItem.text = NSLocalizedString(@"sidemenu_users", nil);
        cell.storyboard = @"Ranking";
        cell.imgIcon.image = [UIImage imageNamed:@"slide-menu-icon-users"];
    } else if (indexPath.row == 3) {
        cell.lblMenuItem.text = NSLocalizedString(@"sidemenu_settings", nil);
        cell.storyboard = @"Settings";
        cell.imgIcon.image = [UIImage imageNamed:@"slide-menu-icon-settings"];
    }else if (indexPath.row == 4) {
        cell.lblMenuItem.text = NSLocalizedString(@"sidemenu_coachtools", nil);
        cell.storyboard = @"Coach";
        cell.imgIcon.image = [UIImage imageNamed:@"slide-menu-icon-coach-tools"];
    }else if (indexPath.row == 5) {
        cell.lblMenuItem.text = NSLocalizedString(@"sidemenu_pushtools", nil);
        cell.storyboard = @"Push";
        cell.imgIcon.image = [UIImage imageNamed:@"slide-menu-icon-push-tools"];
    }
    
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}


#pragma mark - UITableViewDelegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MenuCell *cell = (MenuCell *)[tableView cellForRowAtIndexPath:indexPath];
    
    UIViewController *vc = cell.viewController;
    if (!vc) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:cell.storyboard bundle:nil];
        vc = [storyboard instantiateInitialViewController];
    }
    
    [self.sidePanelController setCenterPanel:vc];
}


@end
