//
//  Lotto6Util.m
//  GoodLuck
//
//  Created by LEE.J.H (kagefree@me.com)
//  Copyright (c) 2012 softvalue.jp All rights reserved.
//

#import "Lotto6Util.h"

@implementation Lotto6Util


/* -------------------------------------------------------------
 以下　C関数
 ---------------------------------------------------------------- */

#define RST_FALSE   1
#define RST_TRUE    0
#define MAX_NUMBERS 6

unsigned int check_odd_even(unsigned int input_data[], unsigned int count)
{
    unsigned int i;
	unsigned int even_count = 0; 
	unsigned int odd_count  = 0; 
	unsigned int bResult = RST_FALSE;
    
	for (i = 0; i < count; i++)
	{
        if ((input_data[i] & 0x1) == 0x1) { 
            odd_count++;
		} else { 
            even_count++;
		}
	}
	if (odd_count >= count || even_count >= count) {
        bResult = RST_TRUE;
	}
	return bResult;
}


unsigned int check_consecutive_numbers(unsigned int input_data[], unsigned int count, unsigned int limit)
{
    unsigned int i;
    unsigned int prev_number = 0;
    unsigned int numbers_count = 0;
    unsigned int bResult = RST_FALSE;
    
    prev_number = input_data[0];
    for (i = 1; i < count; i++) {
        if ((prev_number + 1) == input_data[i]) {
            numbers_count++;
        } else {
            numbers_count = 0;
        }
        prev_number = input_data[i];
    }
    if (numbers_count >= limit) {
        bResult = RST_TRUE;
    }
    return bResult;
}

#define MAX_UPPER_LIMIT 5
unsigned int check_same_level(unsigned int input_data[], unsigned int count, unsigned int limit)
{
    unsigned int i, j;
	unsigned int bResult = RST_FALSE;
	unsigned int low, high, input;
    unsigned int upper_limit[MAX_UPPER_LIMIT][2]  = { { 1, 9 }, { 10, 19 }, { 20, 29 }, { 30, 39 }, { 40, 43 } };
	unsigned int detect_count[MAX_UPPER_LIMIT] = { 0, 0, 0, 0, 0 };
    
	for (i = 0; i < count; i++) {
		input = input_data[i];
        for (j = 0; j < MAX_UPPER_LIMIT; j++) {
			low = upper_limit[j][0];
			high = upper_limit[j][1];
            if (input >= low && input <= high) {
                detect_count[j]++;
			}
		}
	}
    
	for (i = 0; i < MAX_UPPER_LIMIT; i++) {
        if (detect_count[i] >= limit) {
            bResult = RST_TRUE;
			break;
		}
	}
	return bResult;
}

unsigned int check_ng_pattern(unsigned int input_pattern[])
{
	unsigned int i,j;
    unsigned int bResult = RST_FALSE; // false
	unsigned int uiTemp = 0;
	unsigned int myArray[6] = { 0, };
    
    for (i = 0; i < MAX_NUMBERS; i++) {
        myArray[i] = input_pattern[i];
		if (myArray[i] == 0 || myArray[i] > 43) {
            bResult = RST_TRUE;
		}
	}
	if (bResult == RST_FALSE) {
        
	    for (i = 0; i < MAX_NUMBERS; i++) {
            for (j = (MAX_NUMBERS - 1); j > i; j--) {
                if (myArray[j] < myArray[j - 1]) {
                    uiTemp = myArray[j];
				    myArray[j] = myArray[j - 1];
				    myArray[j - 1] = uiTemp;
				}
			}
		}
	}

	bResult = check_odd_even(myArray, MAX_NUMBERS);
	if (bResult == RST_FALSE) {
        bResult = check_same_level(myArray, MAX_NUMBERS, 4);
		if (bResult == RST_FALSE) {
            bResult = check_consecutive_numbers(myArray, MAX_NUMBERS, 4);
		}
	}
    
	return bResult;
}





@end
