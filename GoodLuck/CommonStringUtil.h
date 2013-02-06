//
//  CommonStringUtil.h
//  文字列に関する共通クラス
//
//  Created by LEE.J.H (kagefree@softvalue.jp) on 2012. 1. 31.
//  Copyright (c) 2012 SoftValue.jp All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonStringUtil : NSObject{
    
}

// subString
+ (NSString *) substr:(NSString*)str startIndex:(NSUInteger)sidx endIndex:(NSUInteger)eidx;

// subString
+ (NSString *) substr:(NSString*)str startIndex:(NSUInteger)sidx endIndex:(NSUInteger)eidx;

// trim
+ (NSString *) trim:(NSString*)str;

// spilt
+ (NSArray *) split:(NSString*)delimiter string:(NSString*)str;

// string replace
+ (NSString *) strReplace:(NSString *)search replace:(NSString *)replace string:(NSString*)str;

// int -> string
+ (NSString *) intToString:(NSInteger)intValue;

// string -> int
+ (NSString *) intToString:(NSInteger)intValue;

// isEmpty
+ (BOOL) isEmpty:(NSString*)str;

// ##,###,###,###
+ (NSString *) numberFormat:(NSString*)price;

@end
