//
//  TeamsListTableViewController.m
//  HandballToday
//
//  Created by Roger Gras on 11/11/14.
//  Copyright (c) 2014 rogras. All rights reserved.
//

#import "TeamsListTableViewController.h"
#import "StoryBoardStaticFactory.h"

@interface TeamsListTableViewController ()
{
    NSArray *listTeams;
}

@end

@implementation TeamsListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
     self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self loadTeams];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [listTeams count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"teamCell" forIndexPath:indexPath];
    
    // Configure the cell...
    PFObject *team = listTeams[indexPath.row];
    cell.textLabel.text = team[@"Name"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    PFObject *team = listTeams[indexPath.row];
 
    PFUser *user = [PFUser currentUser];
    [user setObject:team forKey:@"PreferredTeam"];
    [user save];
   
    UIStoryboard *storyboard = [StoryBoardStaticFactory storyBoardForMenu];
    UIViewController *vc = [storyboard instantiateInitialViewController];
    [self presentViewController:vc animated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void) loadTeams
{
    PFQuery *query = [PFQuery queryWithClassName:@"Teams"];
    [query orderByAscending:@"Name"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %lu scores.", (unsigned long)objects.count);
            // Do something with the found objects
            for (PFObject *object in objects) {
                NSLog(@"%@", object.objectId);
            }
            listTeams = [[NSArray alloc] initWithArray:objects];
            [self.tableView reloadData];
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}
@end
