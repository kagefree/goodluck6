//
//  CustomCell.m
//  GoodLuck
//
//  Created by LEE.J.H (kagefree@me.com)
//  Copyright (c) 2012 softvalue.jp All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

@synthesize imgLottoNum1, imgLottoNum2, imgLottoNum3, imgLottoNum4, imgLottoNum5, imgLottoNum6;
@synthesize imgStar1, imgStar2, imgStar3, imgStar4, imgStar5;

-(id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]){
        [self imgFrameSet];
    }
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self imgFrameSet];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)imgFrameSet{
    imgLottoNum1 = [[UIImageView alloc] initWithFrame:CGRectMake(5.0, 6.0, 30.0, 30.0)];
    [self addSubview:imgLottoNum1];
    imgLottoNum2 = [[UIImageView alloc] initWithFrame:CGRectMake(40.0, 6.0, 30.0, 30.0)];
    [self addSubview:imgLottoNum2];
    imgLottoNum3 = [[UIImageView alloc] initWithFrame:CGRectMake(75.0, 6.0, 30.0, 30.0)];
    [self addSubview:imgLottoNum3];
    imgLottoNum4 = [[UIImageView alloc] initWithFrame:CGRectMake(110.0, 6.0, 30.0, 30.0)];
    [self addSubview:imgLottoNum4];
    imgLottoNum5 = [[UIImageView alloc] initWithFrame:CGRectMake(145.0, 6.0, 30.0, 30.0)];
    [self addSubview:imgLottoNum5];
    imgLottoNum6 = [[UIImageView alloc] initWithFrame:CGRectMake(180.0, 6.0, 30.0, 30.0)];
    [self addSubview:imgLottoNum6];
    
    imgStar1 = [[UIImageView alloc] initWithFrame:CGRectMake(215.0, 6.0, 20.0, 20.0)];
    [self addSubview:imgStar1];
    imgStar2 = [[UIImageView alloc] initWithFrame:CGRectMake(235.0, 6.0, 20.0, 20.0)];
    [self addSubview:imgStar2];
    imgStar3 = [[UIImageView alloc] initWithFrame:CGRectMake(255.0, 6.0, 20.0, 20.0)];
    [self addSubview:imgStar3];
    imgStar4 = [[UIImageView alloc] initWithFrame:CGRectMake(275.0, 6.0, 20.0, 20.0)];
    [self addSubview:imgStar4];
    imgStar5 = [[UIImageView alloc] initWithFrame:CGRectMake(295.0, 6.0, 20.0, 20.0)];
    [self addSubview:imgStar5];
}

@end
