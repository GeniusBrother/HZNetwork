//
//  UDSerializationNumView.m
//  mcapp
//
//  Created by xzh on 2016/10/25.
//  Copyright © 2016年 发条橙. All rights reserved.
//

#import "UDSerializationNumView.h"
#import <HZFoundation/HZFoundation.h>
@interface UDSerializationNumView ()

@property(nonatomic, weak) UIImageView *readCountImgView;
@property(nonatomic, weak) UIImageView *starCountImgView;
@property(nonatomic, weak) UIImageView *commentCountImgView;
@property(nonatomic, weak) UILabel *readCountLabel;
@property(nonatomic, weak) UILabel *starCountLabel;
@property(nonatomic, weak) UILabel *commentCountLabel;

@end

@implementation UDSerializationNumView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
        [self loadSubViews];
    }
    return self;
}

#pragma mark - Private Method
- (void)setup
{
    
}

#pragma mark - UI
- (void)loadSubViews
{
    NSArray *imgNameArray = @[@"discover_serialization_read_count_icon",@"discover_serialization_start_count_icon",@"discover_serialization_comment_count_icon"];

    for (NSInteger index = 0; index < imgNameArray.count; index++) {
        UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imgNameArray[index]]];
//        imgView.backgroundColor = [UIColor greenColor];
        [self addSubview:imgView];
        
        UILabel *countLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        countLabel.textColor = [UIColor colorForHex:0x808080];
        countLabel.font = [UIFont systemFontOfSize:11];
//        countLabel.backgroundColor = [UIColor brownColor];
        [self addSubview:countLabel];
        
        if (index == 0) {
            imgView.size = CGSizeMake(11, 6.5);
            self.readCountImgView = imgView;
            self.readCountLabel = countLabel;
        }else if (index == 1) {
            imgView.size = CGSizeMake(7.5, 7.5);
            self.starCountImgView = imgView;
            self.starCountLabel = countLabel;
        }else if (index == 2) {
            imgView.size = CGSizeMake(8.5, 7.5);
            self.commentCountImgView = imgView;
            self.commentCountLabel = countLabel;
        }
        [imgView alignCenterY];
    }

}

- (void)setNumModel:(UDSerializationNumModel *)numModel
{
    _numModel = numModel;
    
    CGFloat imgLableSpace = 5;
    CGFloat labelMaxWidth = HZDeviceWidth * 43/375.0f;
    
    self.readCountImgView.left = 0;
    
    NSNumber *readCount = numModel.views?:@0;
    self.readCountLabel.text = [readCount stringValue];
    [self.readCountLabel sizeToFit];
    
    CGFloat starCountImgViewLeftOffset = 15;
    if (self.readCountLabel.width > labelMaxWidth) {
        self.readCountLabel.width = labelMaxWidth;
        starCountImgViewLeftOffset = 0;
    }
    self.readCountLabel.origin = CGPointMake(self.readCountImgView.right + imgLableSpace, 0);
    self.readCountLabel.height = self.height;
    CGFloat starCountImgViewLeft = self.readCountLabel.right+starCountImgViewLeftOffset;
    
    self.starCountImgView.left = starCountImgViewLeft;
    NSNumber *startCount = numModel.stars?:@0;
    self.starCountLabel.text = [startCount stringValue];
    [self.starCountLabel sizeToFit];
    
    CGFloat commentImgViewLeftOffset = 15;
    if (self.starCountLabel.width > labelMaxWidth) {
        self.starCountLabel.width = labelMaxWidth;
        commentImgViewLeftOffset = 0;
    }
    self.starCountLabel.origin = CGPointMake(self.starCountImgView.right + imgLableSpace, 0);
    self.starCountLabel.height = self.height;
    CGFloat commentImgViewLeft = self.starCountLabel.right + commentImgViewLeftOffset;
    
    
    self.commentCountImgView.left = commentImgViewLeft;
    NSNumber *commentCount = numModel.comments?:@0;
    self.commentCountLabel.text = [commentCount stringValue];
    [self.commentCountLabel sizeToFit];
    if (self.commentCountLabel.width > labelMaxWidth) {
        self.commentCountLabel.width = labelMaxWidth;
    }
    self.commentCountLabel.origin = CGPointMake(self.commentCountImgView.right + imgLableSpace, 0);
    self.commentCountLabel.height = self.height;
    
    self.width = self.commentCountLabel.right;
}


@end
