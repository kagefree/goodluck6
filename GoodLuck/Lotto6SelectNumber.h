//
//  Lotto6SelectNumber.h
//  GoodLuck
//
//  Created by LEE.J.H (kagefree@me.com)
//  Copyright (c) 2012 softvalue.jp All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Lotto6SelectNumber : NSObject{
    BOOL duplication;
    int range;
}
@property  BOOL duplication;
@property  int range;


/* -------------------------------------------------------------
抽出する番号の範囲と重複条件を指定して初期化後オブジェクトを返却
---------------------------------------------------------------- */
-(id)initWithRange:(int)range andWithCheck:(BOOL)duplication;

/* -------------------------------------------------------------
指定された範囲での番号をパラメータの数ほど抽出して返却
---------------------------------------------------------------- */
-(NSMutableArray *)selectNum:(int)selectCount;

/* -------------------------------------------------------------
指定された範囲内でのランダム数字返却
---------------------------------------------------------------- */
-(int)getRandumNum:(int)limitNum;

/* -------------------------------------------------------------
パラメータ配列内に指定数字が存在するかいなかの判定
---------------------------------------------------------------- */
-(Boolean)checkDuplicateNum:(NSArray *)selectedArry inNum:(int)selectedNum;

/* -------------------------------------------------------------
パラメータ配列内の数字を究極の組み合わせで星の数を判定
---------------------------------------------------------------- */
-(int)calcStar:(NSArray *)numArray flg:(int)sign;

@end
