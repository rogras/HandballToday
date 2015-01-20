//
//  HomePagedNews.h
//  DigitalHealth
//
//  Created by Daniel Ruiz on 02/06/14.
//  Copyright (c) 2014 Axa. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PlayersPagedScroll;

@protocol PlayersPagedScrollDelegate <NSObject>

@optional

- (void)playersPagedScroll:(PlayersPagedScroll *)playersPagedScroll
     didScrollToIndex:(NSInteger)index;
- (void)playersPagedScrollDidTapOnCurrentElement:(PlayersPagedScroll *)playersPagedScroll;

@end

@interface PlayersPagedScroll : UIScrollView

@property (weak, nonatomic) id<PlayersPagedScrollDelegate> playersPagedScrollDelegate;

- (void)clearSubviews;
- (void)addImage:(UIImage *)image;

@end
