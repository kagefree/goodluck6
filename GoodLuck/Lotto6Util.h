//
//  Lotto6Util.h
//  GoodLuck
//
//  Created by LEE.J.H (kagefree@me.com)
//  Copyright (c) 2012 softvalue.jp All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Lotto6Util : NSObject{
    
}

unsigned int check_ng_pattern(unsigned int input_pattern[]);
unsigned int check_same_level(unsigned int input_data[], unsigned int count, unsigned int limit);
unsigned int check_consecutive_numbers(unsigned int input_data[], unsigned int count, unsigned int limit);
unsigned int check_odd_even(unsigned int input_data[], unsigned int count);

@end
