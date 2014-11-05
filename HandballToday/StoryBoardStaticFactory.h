//
//  StoryBoardStaticFactory.h
//  Claims
//
//  Created by Roger on 24/02/14.
//  Copyright (c) 2014 AGS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StoryBoardStaticFactory : NSObject

+ (UIStoryboard *)storyBoardForMainScreen;
+ (UIViewController *)instantiateInitialViewControllerForMainScreen;
+ (UIStoryboard *) storyBoardForHomeTab;
+ (UIViewController *) instantiateInitialViewControllerForHomeTab;
+ (UIStoryboard *) storyBoardForShareTab;
+ (UINavigationController *) instantiateInitialViewControllerForShareTab;
+ (UIStoryboard *) storyBoardForDoctorTab;
+ (UIViewController *) instantiateInitialViewControllerForDoctorTab;
+ (UIStoryboard *) storyBoardForMeTab;
+ (UIViewController *) instantiateInitialViewControllerForMeTab;
+ (UIStoryboard *) storyBoardForQuestionnaire;
+ (UIViewController *) instantiateInitialViewControllerForQuestionnaire;
+ (UIStoryboard *) storyBoardForErgonomy;
+ (UIViewController *) instantiateInitialViewControllerForErgonomy;
+ (UIStoryboard *) storyBoardForPills;
+ (UIViewController *) instantiateInitialViewControllerForPills;
+ (UIStoryboard *) storyBoardForHistory;
+ (UIViewController *) instantiateInitialViewControllerForHistory;
+ (UIStoryboard *) storyBoardForMenu;
+ (UIViewController *) instantiateInitialViewControllerForMenu;

@end
