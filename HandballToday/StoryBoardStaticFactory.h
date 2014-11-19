//
//  StoryBoardStaticFactory.h
//  Claims
//
//  Created by Roger on 24/02/14.
//  Copyright (c) 2014 AGS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StoryBoardStaticFactory : NSObject

+ (UIStoryboard *) storyBoardForMenu;
+ (UIViewController *) instantiateInitialViewControllerForMenu;
+ (UIStoryboard *) storyBoardForPreferredTeam;
+ (UIViewController *) instantiateInitialViewControllerForPreferredTeam;
+ (UIStoryboard *) storyBoardForNews;
+ (UIViewController *) instantiateInitialViewControllerForNews;


@end
