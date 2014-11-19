//
//  HomeViewController.h
//  HandballToday
//
//  Created by Roger Gras on 5/11/14.
//  Copyright (c) 2014 rogras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomePagedNews.h"

@interface HomeViewController : UIViewController<HomePagedNewsDelegate>

@property (weak, nonatomic) IBOutlet UIButton *btnHealthProfile;
@property (weak, nonatomic) IBOutlet UIButton *btnAppointment;
@property (weak, nonatomic) IBOutlet UIButton *btnEmergency;
@property (weak, nonatomic) IBOutlet UILabel *lblHealthProfile;
@property (weak, nonatomic) IBOutlet UILabel *lblAppointment;
@property (weak, nonatomic) IBOutlet UILabel *lblEmergency;
@property (weak, nonatomic) IBOutlet UIView *headerCaptionContainer;
@property (weak, nonatomic) IBOutlet UIView *borderView;
@property (weak, nonatomic) IBOutlet UIPageControl *headerPageControl;
@property (weak, nonatomic) IBOutlet UILabel *headerTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *headerTopicLabel;
@property (strong, nonatomic) NSArray *articlesToDisplay;
@property (weak, nonatomic) IBOutlet HomePagedNews *pagedScrollView;

- (IBAction)doShowSideMenu:(id)sender;
- (IBAction)doShowProfile:(id)sender;
- (IBAction)doShowAppointments:(id)sender;
- (IBAction)doShowEmergency:(id)sender;
@end
