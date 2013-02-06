//
//  CommonDateUtil.m
//  日付に関する共通クラス
//
//  Created by LEE.J.H (kagefree@softvalue.jp) on 2012. 1. 31.
//  Copyright (c) 2012 SoftValue.jp All rights reserved.
//

#import "CommonDateUtil.h"

@implementation CommonDateUtil

+(NSDate *) getCurrentDate
{
    NSDate *curDate = [[NSDate alloc] init];
    return curDate;
}

+(int) getYear:(NSDate *)_date
{
	NSCalendar *calendar =[NSCalendar currentCalendar];
	NSCalendarUnit unitFlags = NSYearCalendarUnit;
	NSDateComponents *comp = [calendar components:unitFlags fromDate:_date];
    return [comp year];
}

+(int) getMonth:(NSDate *)_date
{
	NSCalendar *calendar =[NSCalendar currentCalendar];
	NSCalendarUnit unitFlags = NSMonthCalendarUnit;
	NSDateComponents *comp = [calendar components:unitFlags fromDate:_date];
    return [comp month];
}

+(int) getDay:(NSDate *)_date
{
	NSCalendar *calendar =[NSCalendar currentCalendar];
	NSCalendarUnit unitFlags = NSDayCalendarUnit;
	NSDateComponents *comp = [calendar components:unitFlags fromDate:_date];
    return [comp day];
}

+(int) getHourOfDay:(NSDate *)_date
{
	NSCalendar *calendar =[NSCalendar currentCalendar];
	NSCalendarUnit unitFlags = NSHourCalendarUnit;
	NSDateComponents *comp = [calendar components:unitFlags fromDate:_date];
    return [comp hour];
}

+(int) getMinute:(NSDate *)_date
{
	NSCalendar *calendar =[NSCalendar currentCalendar];
	NSCalendarUnit unitFlags = NSMinuteCalendarUnit;
	NSDateComponents *comp = [calendar components:unitFlags fromDate:_date];
    return [comp minute];
}

+(int) getSecond:(NSDate *)_date
{
	NSCalendar *calendar =[NSCalendar currentCalendar];
	NSCalendarUnit unitFlags = NSSecondCalendarUnit;
	NSDateComponents *comp = [calendar components:unitFlags fromDate:_date];
    return [comp second];
}

+(int) getDayOfWeek:(NSDate *)_date
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"c"];
    NSString *numStr = [dateFormat stringFromDate:_date];
    int num = [numStr intValue]; // 1 - 7 (1:日曜日 - 7:土曜日)
    return num;
}

// _formatString ex) yyyy.MM.dd G `at` HH:mm:ss zzz -> 2012.01.23 AD at 15:08:56 PDT
// _formatString ex) EEE, MMM d, ``yy -> Wed, July 10, '96
// _formatString ex) h:mm a -> 12:18 PM
// _formatString ex) H:mm a zzz -> 15:18 PM, GMT+09:00 
// _formatString ex) yyyy/MM/dd HH:mm:ss -> 2012/02/23 03:45:51
+(NSString *) getDateToString:(NSDate *)_Date andWithFormat:(NSString *)_formatString
{
	NSLocale *locale = [NSLocale currentLocale]; 
//	NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"]; 
	NSDateFormatter *dateFormat =[[NSDateFormatter alloc] init];
	[dateFormat setLocale:locale];
	[dateFormat setDateFormat:_formatString];
	[dateFormat setDateFormat:_formatString];
	return [dateFormat stringFromDate:_Date];
}

+(NSString *) getDateToString:(NSDate *)_Date andWithFormat:(NSString *)_formatString andWithLocale:(NSLocale *)_locale
{
	NSDateFormatter *dateFormat =[[NSDateFormatter alloc] init];
	[dateFormat setLocale:_locale];
	[dateFormat setDateFormat:_formatString];
	return [dateFormat stringFromDate:_Date];
}
	
+(int)compareTo:(NSDate *)_date1 andWithAnother:(NSDate *)_date2
{
	if([_date1 compare:_date2] == NSOrderedAscending){
		return -1;
	}else if([_date1 compare:_date2] == NSOrderedDescending){
		return 1;
	}
	return 0;
}

#define TIME_INTERVAL_FOR_DAY 86400 // 1日(24*60*60)
+(int)betweenDays:(NSDate *)_date1 andWithAnother:(NSDate *)_date2
{
	NSTimeInterval interval =[_date2 timeIntervalSinceDate:_date1];
	// Add 1 for correct number of days
	return (((int)interval / TIME_INTERVAL_FOR_DAY) + 1);	
}

+(NSDate *) addDay:(NSDate *)_date andWithDay:(int)_num
{
	return [NSDate dateWithTimeInterval:(TIME_INTERVAL_FOR_DAY * _num) sinceDate:_date];
}

+(NSDate *) addMonth:(NSDate *)_date andWithMonth:(int)_num;
{
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents * dateComponents = [[NSDateComponents alloc] init];
	[dateComponents setMonth:_num];
	return [calendar dateByAddingComponents:dateComponents toDate:_date options:0];
}

+(int) getMaximumDay:(int)_month
{
	NSDate *curDate = [NSDate date];
	NSCalendar *currentCalendar = [NSCalendar currentCalendar];
	NSRange daysRange = [currentCalendar rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:curDate];
	
	return daysRange.length;
}

@end
