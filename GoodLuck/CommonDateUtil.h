//
//  CommonDateUtil.h
//  日付に関する共通クラス
//
//  Created by LEE.J.H (kagefree@softvalue.jp) on 2012. 1. 31.
//  Copyright (c) 2012 SoftValue.jp All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonDateUtil : NSObject{
    
}

// システム現在日付取得
+(NSDate *) getCurrentDate;

// パラメータ日付から年度（YYYY）を取得
+(int) getYear:(NSDate *)_date;

// パラメータ日付から月（MM）を取得
+(int) getMonth:(NSDate *)_date;

// パラメータ日付から日（DD）を取得
+(int) getDay:(NSDate *)_date;

// パラメータ日付から時間（hh）を取得
+(int) getHourOfDay:(NSDate *)_date;

// パラメータ日付から分（mm）を取得
+(int) getMinute:(NSDate *)_date;

// パラメータ日付から秒（ss）を取得
+(int) getSecond:(NSDate *)_date;

// パラメータ日付から曜日を取得
+(int) getDayOfWeek:(NSDate *)_date;

// パラメータ日付を決めて形式の文字列に変換
+(NSString *) getDateToString:(NSDate *)_Date andWithFormat:(NSString *)_formatString;

// パラメータ日付を決めて形式と地域の文字列に変換
+(NSString *) getDateToString:(NSDate *)_Date andWithFormat:(NSString *)_formatString andWithLocale:(NSLocale *)_locale;

// パラメータ日付の前後を比較（＋値は_date1 >_date2）
+(int)compareTo:(NSDate *)_date1 andWithAnother:(NSDate *)_date2;

// パラメータ日付間の日数差を返却
+(int)betweenDays:(NSDate *)_date1 andWithAnother:(NSDate *)_date2;

// パラメータ日付に指定日を加算した日付を返却
+(NSDate *) addDay:(NSDate *)_date andWithDay:(int)_num;

// パラメータ日付に指定月を加算した日付を返却
+(NSDate *) addMonth:(NSDate *)_date andWithMonth:(int)_num;

// パラメータ日付の月の最終日を返却
+(int) getMaximumDay:(int)_month;

@end
