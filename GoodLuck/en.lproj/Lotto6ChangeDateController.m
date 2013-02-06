//
//  Lotto6ChangeDateController.m
//  GoodLuck
//
//  Created by LEE.J.H (kagefree@me.com)
//  Copyright (c) 2012 softvalue.jp All rights reserved.
//

#import "Lotto6ChangeDateController.h"

@implementation Lotto6ChangeDateController

@synthesize datePicker, selectedDate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray	*language = [defaults objectForKey:@"AppleLanguages"];
    NSString *currentLanguage = [language objectAtIndex:0];
    NSLocale *locale = nil;
    if([@"ko" isEqualToString:currentLanguage]){
        locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ko_KR"];
    }else if([@"ja" isEqualToString:currentLanguage]){
        locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"];
    }else{
        locale = [NSLocale currentLocale];
    }
    datePicker.locale = locale;
    

}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    selectedDate = [datePicker date];
}


-(void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event
{
    UITouch *touch = [touches anyObject];
    
    if(touch.view.tag == 1)  {
        UIAlertView *alert = [[UIAlertView alloc] init];
        alert.message = @"Touched";
        alert.title = @"GoodLuck6";
        [alert addButtonWithTitle:@"OK"];
        [alert show];
    }
}
@end
