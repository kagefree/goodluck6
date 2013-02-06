//
//  Lotto6ChangeDateController.h
//  GoodLuck
//
//  Created by LEE.J.H (kagefree@me.com)
//  Copyright (c) 2012 softvalue.jp All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Lotto6ChangeDateController : UIViewController{
    IBOutlet UIDatePicker *datePicker;
}

@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) NSDate *selectedDate;

@end
