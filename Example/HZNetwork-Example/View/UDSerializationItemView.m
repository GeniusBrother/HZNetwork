//
//  UDSerializationItemView.m
//  mcapp
//
//  Created by xzh on 2016/10/24.
//  Copyright © 2016年 发条橙. All rights reserved.
//

#import "UDSerializationItemView.h"
#import <HZFoundation/HZFoundation.h>
#import <TTTAttributedLabel/TTTAttributedLabel.h>
#import "UIImageView+HZExtend.h"
@interface UDSerializationItemView ()<TTTAttributedLabelDelegate>

@property(nonatomic, weak) UIImageView *coverImgView;
@property(nonatomic, weak) UILabel *titlelabel;
@property(nonatomic, weak) UILabel *subTitleLabel;
@property(nonatomic, weak) UILabel *authorLabel;
@property(nonatomic, weak) UILabel *updateTimeLabel;
@property(nonatomic, weak) UIView *lineView;

@end

@implementation UDSerializationItemView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadSubViews];
    }
    return self;
}

- (void)loadSubViews
{
    CGFloat coverImgWidth = 140;
    CGFloat coverImgHeight = 80;
    UIImageView *coverImgView = [[UIImageView alloc] init];
    coverImgView.frame = CGRectMake(0, 0, coverImgWidth, coverImgHeight);
    coverImgView.contentMode = UIViewContentModeScaleAspectFill;
    coverImgView.clipsToBounds = YES;
    coverImgView.layer.cornerRadius = 5;
    coverImgView.layer.masksToBounds = YES;
    [self addSubview:coverImgView];
    self.coverImgView = coverImgView;
    
    self.height = self.coverImgView.bottom;
    
    UILabel *titlelabel = [[UILabel alloc] initWithFrame:CGRectZero];
    titlelabel.origin = CGPointMake(coverImgView.right + 10, coverImgView.top);
    titlelabel.numberOfLines = 2;
    titlelabel.textColor = [UIColor colorForHex:0x1D324C];
    titlelabel.font = [UIFont systemFontOfSize:13];
//    titlelabel.backgroundColor = [UIColor brownColor];
    [self addSubview:titlelabel];
    self.titlelabel = titlelabel;
    
    UILabel *subTitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    subTitleLabel.left = self.titlelabel.left;
    subTitleLabel.textColor = [UIColor colorForHex:0x878f9a];
    subTitleLabel.font = [UIFont systemFontOfSize:12];
//    subTitleLabel.backgroundColor = [UIColor brownColor];
    [self addSubview:subTitleLabel];
    self.subTitleLabel = subTitleLabel;
    
    UILabel *authorLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    authorLabel.left = self.titlelabel.left;
    authorLabel.textColor = [UIColor colorForHex:0x1d324c];
    authorLabel.font = [UIFont systemFontOfSize:12];
    authorLabel.userInteractionEnabled = YES;
//    authorLabel.backgroundColor = [UIColor brownColor];
    [self addSubview:authorLabel];
    self.authorLabel = authorLabel;
 
    UILabel *updateTimeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    updateTimeLabel.textColor = [UIColor colorForHex:0x1d324c];
    updateTimeLabel.font = [UIFont systemFontOfSize:11];
//    updateTimeLabel.backgroundColor = [UIColor brownColor];
    [self addSubview:updateTimeLabel];
    self.updateTimeLabel = updateTimeLabel;
}

- (void)setCollectionModel:(UDCollectionModel *)collectionModel
{
    _collectionModel = collectionModel;
    
    NSString *url = collectionModel.image;
    [self.coverImgView safeSetImageWithURL:url placeholder:nil];
    
    NSString *title = collectionModel.title;
    self.titlelabel.text = title.isNoEmpty?title:@"";
    CGFloat titleMaxWidth = self.width - self.titlelabel.left;
    CGSize size = [title boundingRectWithSize:CGSizeMake(titleMaxWidth, 36) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine attributes:@{NSFontAttributeName : self.titlelabel.font} context:nil].size;
    self.titlelabel.size = CGSizeMake(ceil(size.width), ceil(size.height));
    
    BOOL isTwoLineTitle = self.titlelabel.height > 30; //>30说明为2行标题
    CGFloat subTitleMaxWidth = titleMaxWidth;
    NSString *subTitle = collectionModel.info;
    self.subTitleLabel.text = subTitle.isNoEmpty?subTitle:@"";
    [self.subTitleLabel sizeToFit];
    if (self.subTitleLabel.width >= subTitleMaxWidth) {
        self.subTitleLabel.width = subTitleMaxWidth;
    }
    self.subTitleLabel.top = self.titlelabel.bottom + (isTwoLineTitle?5:10);
    
    NSString *updateTime = [[NSDate dateWithTimeIntervalSince1970:collectionModel.updatedAt.longLongValue] formatDateWithSeparator:@"."];
    self.updateTimeLabel.text = updateTime.isNoEmpty?[NSString stringWithFormat:@"%@更新",updateTime]:@"";
    [self.updateTimeLabel sizeToFit];
    self.updateTimeLabel.right = self.width - 14;
    
    NSString *authorName = @"GeniusBrother";
    self.authorLabel.text = authorName.isNoEmpty?authorName:@"";
    [self.authorLabel sizeToFit];
    CGFloat authorLabelMaxWidth = self.width - self.authorLabel.left - self.updateTimeLabel.width - 8;
    if (self.authorLabel.width >= authorLabelMaxWidth) {
        self.authorLabel.width = authorLabelMaxWidth;
    }
    self.authorLabel.bottom = self.coverImgView.bottom;
    
    self.updateTimeLabel.centerY = self.authorLabel.centerY;
}
@end
