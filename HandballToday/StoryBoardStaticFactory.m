#import "StoryBoardStaticFactory.h"


@implementation StoryBoardStaticFactory


+ (UIStoryboard *) storyBoardForMenu{
    return [UIStoryboard storyboardWithName:@"Menu" bundle:nil];
}
+ (UIViewController *) instantiateInitialViewControllerForMenu
{
    UIStoryboard *pcStoryBoard = [StoryBoardStaticFactory storyBoardForMenu];
    UINavigationController *nc = [pcStoryBoard instantiateInitialViewController];
    return nc.viewControllers[0];
}

+ (UIStoryboard *) storyBoardForPreferredTeam{
    return [UIStoryboard storyboardWithName:@"PreferredTeam" bundle:nil];
}

+ (UIViewController *) instantiateInitialViewControllerForPreferredTeam{
    UIStoryboard *pcStoryBoard = [StoryBoardStaticFactory storyBoardForPreferredTeam];
    return [pcStoryBoard instantiateInitialViewController];
}

+ (UIStoryboard *) storyBoardForNews
{
    return [UIStoryboard storyboardWithName:@"News" bundle:nil];
}
+ (UIViewController *) instantiateInitialViewControllerForNews
{
    UIStoryboard *pcStoryBoard = [StoryBoardStaticFactory storyBoardForNews];
    return [pcStoryBoard instantiateInitialViewController];
}

+ (UIStoryboard *) storyBoardForPlayers
{
    return [UIStoryboard storyboardWithName:@"Players" bundle:nil];
}
+ (UIViewController *) instantiateInitialViewControllerForPlayers
{
    UIStoryboard *pcStoryBoard = [StoryBoardStaticFactory storyBoardForPlayers];
    return [pcStoryBoard instantiateInitialViewController];
}

@end
