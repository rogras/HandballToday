//
//  HomePagedNews.m
//  DigitalHealth
//
//  Created by Daniel Ruiz on 02/06/14.
//  Copyright (c) 2014 Axa. All rights reserved.
//

#import "PlayersPagedScroll.h"

@interface PlayersPagedScroll() <UIScrollViewDelegate>

@property (weak, nonatomic) UIView *lastView;
@property (nonatomic) NSInteger currentPage;

@end

@implementation PlayersPagedScroll

#pragma mark - View Lifecycle

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code
        [self setupSubviews];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        [self setupSubviews];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews
{
    self.delegate = self;
    self.pagingEnabled = YES;
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
}

#pragma mark - Public methods

- (void)clearSubviews
{
    for (UIView *subview in self.subviews) {
        [subview removeFromSuperview];
    }
    
    self.contentSize = CGSizeZero;
    
    self.lastView = nil;
}

- (void)addImage:(UIImage *)image
{
    
    // Resize image
    UIGraphicsBeginImageContext(CGSizeMake(640, 960));
    [image drawInRect: CGRectMake(0, 0, 640, 960)];
    UIImage *smallImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    CGRect frame = self.bounds;
    
    frame.origin.x = self.lastView.frame.origin.x + self.lastView.frame.size.width;
    
    UIImageView *newImageView = [[UIImageView alloc] initWithFrame:frame];
    newImageView.contentMode = UIViewContentModeScaleAspectFill;
    newImageView.image = smallImage;
    newImageView.backgroundColor = [UIColor whiteColor];
    
    [self addImageView:newImageView];
}

- (void)addImageView:(UIImageView *)imageView
{
    CGSize contentSize = self.contentSize;
    [self addSubview:imageView];
    [self sendSubviewToBack:imageView];
    
    contentSize.width += imageView.frame.size.width;
    
    self.contentSize = contentSize;
    
    imageView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *singleFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                      action:@selector(onViewTap:)];
    [imageView addGestureRecognizer:singleFingerTap];
    
    self.lastView = imageView;
}

#pragma mark - IBActions

- (void)onViewTap:(id)sender
{
    if ([self.playersPagedScrollDelegate respondsToSelector:@selector(playersPagedScrollDidTapOnCurrentElement:)]) {
        [self.playersPagedScrollDelegate playersPagedScrollDidTapOnCurrentElement:self];
    }
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pageWidth = self.frame.size.width;
    float fractionalPage = self.contentOffset.x / pageWidth;
    NSInteger page = lround(fractionalPage);
    
    self.currentPage = page;
    
    if ([self.playersPagedScrollDelegate respondsToSelector:@selector(playersPagedScroll:didScrollToIndex:)]) {
        [self.playersPagedScrollDelegate playersPagedScroll:self
                                 didScrollToIndex:page];
    }
}

@end
