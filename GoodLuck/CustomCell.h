//
//  CustomCell.h
//  GoodLuck
//
//  Created by LEE.J.H (kagefree@me.com)
//  Copyright (c) 2012 softvalue.jp All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell{
    UIImageView *imgLottoNum1;
    UIImageView *imgLottoNum2;
    UIImageView *imgLottoNum3;
    UIImageView *imgLottoNum4;
    UIImageView *imgLottoNum5;
    UIImageView *imgLottoNum6;
    
    UIImageView *imgStar1;
    UIImageView *imgStar2;
    UIImageView *imgStar3;
    UIImageView *imgStar4;
    UIImageView *imgStar5;
}

@property (strong, nonatomic) UIImageView *imgLottoNum1;
@property (strong, nonatomic) UIImageView *imgLottoNum2;
@property (strong, nonatomic) UIImageView *imgLottoNum3;
@property (strong, nonatomic) UIImageView *imgLottoNum4;
@property (strong, nonatomic) UIImageView *imgLottoNum5;
@property (strong, nonatomic) UIImageView *imgLottoNum6;
@property (strong, nonatomic) UIImageView *imgStar1;
@property (strong, nonatomic) UIImageView *imgStar2;
@property (strong, nonatomic) UIImageView *imgStar3;
@property (strong, nonatomic) UIImageView *imgStar4;
@property (strong, nonatomic) UIImageView *imgStar5;

-(void) imgFrameSet;
@end
