//
//  HomePagedNews.h
//  DigitalHealth
//
//  Created by Daniel Ruiz on 02/06/14.
//  Copyright (c) 2014 Axa. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HomePagedNews;

@protocol HomePagedNewsDelegate <NSObject>

@optional

- (void)homePagedNews:(HomePagedNews *)homePagedNews
     didScrollToIndex:(NSInteger)index;
- (void)homePagedNewsDidTapOnCurrentElement:(HomePagedNews *)homePagedNews;

@end

@interface HomePagedNews : UIScrollView

@property (weak, nonatomic) id<HomePagedNewsDelegate> homePagedNewsDelegate;

- (void)clearSubviews;
- (void)addImage:(UIImage *)image;
- (void)addImageWithUrlString:(NSString *)urlString;

@end
