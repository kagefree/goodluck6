//
//  CommonStringUtil.h
//  文字列に関する共通クラス
//
//  Created by LEE.J.H (kagefree@softvalue.jp) on 2012. 1. 31.
//  Copyright (c) 2012 SoftValue.jp All rights reserved.
//

#import "CommonStringUtil.h"

@implementation CommonStringUtil

// subString
+ (NSString *) substr:(NSString*)str index:(NSInteger)idx 
{
	NSString *ret = nil;
	
	if (idx<0) {
		ret = [str substringFromIndex:[str length]+idx];
	}else{
		ret = [str substringToIndex:idx];
	}
	return ret;
}

// subString
+ (NSString *) substr:(NSString*)str startIndex:(NSUInteger)sidx endIndex:(NSUInteger)eidx
{
	NSRange strRange = {sidx,eidx};
	NSString *ret = [str substringWithRange:strRange];
	return ret;
}

// trim
+ (NSString *) trim:(NSString*)str 
{
	NSString *ret = [str stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
	return ret;
}

// spilt
+ (NSArray *) split:(NSString*)delimiter string:(NSString*)str
{
	NSArray *ret = [str componentsSeparatedByString:delimiter];
	return ret;
}

// string replace
+ (NSString *) strReplace:(NSString *)search replace:(NSString *)replace string:(NSString*)str
{
	NSString *ret = [str stringByReplacingOccurrencesOfString:search withString:replace];
	return ret;
}

// int -> string
+ (NSString *) intToString:(NSInteger)intValue{
	NSString* ret = [NSString stringWithFormat:@"%d", intValue];
	return ret;
}	

// string -> int
+ (int) StringToInt:(NSString *)_string{
	int ret = [_string intValue];
	return ret;
}

// isEmpty
+ (BOOL) isEmpty:(NSString*)str
{
	if ([@"" isEqualToString:str]) {
		return YES;
	}else{
		return NO;
	}
}

// ##,###,###,###
+ (NSString *) numberFormat:(NSString*)price
{
	NSNumber *result = nil;
	NSString* ret = nil;
	
	@try{
		result = [NSNumber numberWithLongLong: [price longLongValue]];
		NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
		[numberFormatter setFormatterBehavior:NSNumberFormatterBehavior10_4];
		[numberFormatter setDecimalSeparator:@","];
		[numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
		
		ret = [numberFormatter stringFromNumber:result];
		
	}@catch (NSException * e) {
		ret = @"0";
	}@finally {}

	return ret;	
}

@end
