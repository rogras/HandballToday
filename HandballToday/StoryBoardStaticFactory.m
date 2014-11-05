#import "StoryBoardStaticFactory.h"


@implementation StoryBoardStaticFactory


+ (UIStoryboard *)storyBoardForMainScreen
{
    return [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
}


+ (UIViewController *)instantiateInitialViewControllerForMainScreen
{
    UIStoryboard *sb = [StoryBoardStaticFactory storyBoardForMainScreen];
    return [sb instantiateInitialViewController];
}


+ (UIStoryboard *) storyBoardForHomeTab
{
    return [UIStoryboard storyboardWithName:@"HomeTab" bundle:nil];
}

+ (UIViewController *) instantiateInitialViewControllerForHomeTab
{
    UIStoryboard *pcStoryBoard = [StoryBoardStaticFactory storyBoardForHomeTab];
    return [pcStoryBoard instantiateInitialViewController];
}

+ (UIStoryboard *) storyBoardForShareTab
{
    return [UIStoryboard storyboardWithName:@"ShareTab" bundle:nil];
}

+ (UINavigationController *) instantiateInitialViewControllerForShareTab
{
    UIStoryboard *pcStoryBoard = [StoryBoardStaticFactory storyBoardForShareTab];
    return [pcStoryBoard instantiateInitialViewController];
}

+ (UIStoryboard *) storyBoardForDoctorTab
{
    return [UIStoryboard storyboardWithName:@"DoctorTab" bundle:nil];
}

+ (UIViewController *) instantiateInitialViewControllerForDoctorTab
{
    UIStoryboard *pcStoryBoard = [StoryBoardStaticFactory storyBoardForDoctorTab];
    return [pcStoryBoard instantiateInitialViewController];
}

+ (UIStoryboard *) storyBoardForMeTab
{
    return [UIStoryboard storyboardWithName:@"MeTab" bundle:nil];
}

+ (UIViewController *) instantiateInitialViewControllerForMeTab
{
    UIStoryboard *pcStoryBoard = [StoryBoardStaticFactory storyBoardForMeTab];
    return [pcStoryBoard instantiateInitialViewController];
}

+ (UIStoryboard *) storyBoardForQuestionnaire
{
    return [UIStoryboard storyboardWithName:@"Questionnaire" bundle:nil];
}

+ (UIViewController *) instantiateInitialViewControllerForQuestionnaire
{
    UIStoryboard *pcStoryBoard = [StoryBoardStaticFactory storyBoardForQuestionnaire];
    return [pcStoryBoard instantiateInitialViewController];
}

+ (UIStoryboard *) storyBoardForErgonomy
{
    return [UIStoryboard storyboardWithName:@"Ergonomy" bundle:nil];
}

+ (UIViewController *) instantiateInitialViewControllerForErgonomy
{
    UIStoryboard *pcStoryBoard = [StoryBoardStaticFactory storyBoardForErgonomy];
    UINavigationController *nc = [pcStoryBoard instantiateInitialViewController];
    return nc.viewControllers[0];
}

+ (UIStoryboard *) storyBoardForPills
{
    return [UIStoryboard storyboardWithName:@"Pills" bundle:nil];
}

+ (UIViewController *) instantiateInitialViewControllerForPills
{
    UIStoryboard *pcStoryBoard = [StoryBoardStaticFactory storyBoardForPills];
    UINavigationController *nc = [pcStoryBoard instantiateInitialViewController];
    return nc.viewControllers[0];
}

+ (UIStoryboard *) storyBoardForHistory
{
    return [UIStoryboard storyboardWithName:@"History" bundle:nil];
}

+ (UIViewController *) instantiateInitialViewControllerForHistory
{
    UIStoryboard *pcStoryBoard = [StoryBoardStaticFactory storyBoardForHistory];
    UINavigationController *nc = [pcStoryBoard instantiateInitialViewController];
    return nc.viewControllers[0];
}

+ (UIStoryboard *) storyBoardForMenu{
    return [UIStoryboard storyboardWithName:@"Menu" bundle:nil];
}
+ (UIViewController *) instantiateInitialViewControllerForMenu
{
    UIStoryboard *pcStoryBoard = [StoryBoardStaticFactory storyBoardForMenu];
    UINavigationController *nc = [pcStoryBoard instantiateInitialViewController];
    return nc.viewControllers[0];
}

@end
