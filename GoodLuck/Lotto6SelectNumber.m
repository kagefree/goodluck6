//
//  Lotto6SelectNumber.m
//  GoodLuck
//
//  Created by LEE.J.H (kagefree@me.com)
//  Copyright (c) 2012 softvalue.jp All rights reserved.
//

#import "Lotto6SelectNumber.h"

@implementation Lotto6SelectNumber

@synthesize range, duplication;

/* -------------------------------------------------------------
抽出する番号の範囲と重複条件を指定して初期化後オブジェクトを返却
---------------------------------------------------------------- */
-(id)initWithRange:(int)_range andWithCheck:(BOOL)_duplication{
	self.range = _range;
	self.duplication = _duplication;

	return self;
}

/* -------------------------------------------------------------
指定された範囲での番号をパラメータの数ほど抽出して返却
---------------------------------------------------------------- */
-(NSMutableArray *)selectNum:(int)selectCount{
    // 数字６個を重複しないよう抽出
    NSMutableArray *selectedArry = [[NSMutableArray alloc] init];
    for(int i=0; [selectedArry count]<selectCount; i++){
        int selectedNum = [self getRandumNum:range];
        if(!duplication){	// 重複不許
            if(![self checkDuplicateNum:selectedArry inNum:selectedNum]){
                NSString *tmpStr = [NSString stringWithFormat:@"%d", selectedNum];
                if([tmpStr length] == 1){
                     tmpStr = [@"0" stringByAppendingFormat:tmpStr];
                }
                [selectedArry addObject:tmpStr];
            }
        }else{	// 重複許可
                NSString *tmpStr = [NSString stringWithFormat:@"%d", selectedNum];
                if([tmpStr length] == 1){
                     tmpStr = [@"0" stringByAppendingFormat:tmpStr];
                }
                [selectedArry addObject:tmpStr];
        }
    }
	
	return selectedArry;
}
	
/* -------------------------------------------------------------
指定された範囲内でのランダム数字返却
---------------------------------------------------------------- */
-(int)getRandumNum:(int)limitNum{
    NSInteger res = 0;
    while(res == 0){
        res = arc4random_uniform((int)limitNum);
    }
    
    return res;
}

/* -------------------------------------------------------------
パラメータ配列内に指定数字が存在するかいなかの判定
---------------------------------------------------------------- */
-(Boolean)checkDuplicateNum:(NSArray *)selectedArry inNum:(int)selectedNum{
    NSString *tmpStr = [NSString stringWithFormat:@"%d", selectedNum];
    if([tmpStr length] == 1){
        tmpStr = [@"0" stringByAppendingFormat:tmpStr];
    }

    Boolean res = [selectedArry containsObject:tmpStr];
    return res;
}

/* -------------------------------------------------------------
パラメータ配列内の数字を究極の組み合わせで星の数を判定
---------------------------------------------------------------- */
-(int)calcStar:(NSArray *)numArray flg:(int)sign{
	int numStar = 0;
    if(sign){
        for(NSString *numString in numArray){
            numStar += [numString intValue];
        }
        return numStar % [numArray count];
    }else{
        for(NSString *numString in numArray){
            numStar *= [numString intValue];
        }
        return numStar % [numArray count];
    }
}


@end
