//
//  ArticleDetailTableViewController.m
//  DigitalHealth
//
//  Created by Daniel Ruiz on 22/05/14.
//  Copyright (c) 2014 Axa. All rights reserved.
//

#import "ArticleDetailViewController.h"

@interface ArticleDetailViewController ()


@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *articleImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UILabel *relatedArticlesLabel;
@property (weak, nonatomic) IBOutlet UIView *relatedArticlesContainerView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *relatedArticlesContainerHeightConstraint;

@end

@implementation ArticleDetailViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupSubiews];
    
    [self _displayArticle:self.articleEntity];
    
}

- (void)setupSubiews
{
    
    self.articleImageView.clipsToBounds = YES;
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(doShare:)];
    self.navigationItem.rightBarButtonItem = barButtonItem;
    
    self.relatedArticlesContainerHeightConstraint.constant = 0.0f;
    self.relatedArticlesLabel.text = NSLocalizedString(@"content_related_articles", nil);
}


#pragma mark - Public methods

- (void)doShare:(id)sender
{
    
}

#pragma mark - Private methods

- (void)_displayArticle:(PFObject *)articleEntity
{
    if (!articleEntity) {
        return;
    }
    
    self.title = articleEntity[@"title"];
    
        PFFile *theImage = [articleEntity objectForKey:@"image"];
        NSData *imageData = [theImage getData];
        UIImage *image = [UIImage imageWithData:imageData];
        
        self.articleImageView.image = image;
    
    self.titleLabel.text = articleEntity[@"title"];
    
    /*
    if (articleEntity.hasDetail.boolValue) {
        
        NSString *body = [NSString stringWithFormat:@"<P STYLE=\"color:gray\">%@</p>%@", articleEntity.teaser, articleEntity.body];
        NSString *formatedHTML = [Utils getHtml:body withCSS:@"CSS_Content"];
        
        if (self.bodyLabel) {
            NSMutableAttributedString *attributedBody = [[NSMutableAttributedString alloc] initWithData:[formatedHTML dataUsingEncoding:NSUTF8StringEncoding]
                                                                                                options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
                                                                                                          NSCharacterEncodingDocumentAttribute: @(NSUTF8StringEncoding)}
                                                                                     documentAttributes:nil
                                                                                                  error:nil];
            
            self.bodyLabel.attributedText = attributedBody;
        }
        else {
            [self.webView loadHTMLString:formatedHTML
                                 baseURL:nil];
            
            //[self.webView sizeToFit];
        }
     
    }
     */
}

@end
