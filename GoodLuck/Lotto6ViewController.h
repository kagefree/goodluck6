//
//  Lotto6ViewController.h
//  GoodLuck
//
//  Created by LEE.J.H (kagefree@me.com)
//  Copyright (c) 2012 softvalue.jp All rights reserved.
//
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@class Lotto6SaveListViewController;
@class Lotto6ChangeDateController;

@interface Lotto6ViewController : UIViewController<UIAlertViewDelegate>{
    IBOutlet UIImageView *imgLottoNum1;
    IBOutlet UIImageView *imgLottoNum2;
    IBOutlet UIImageView *imgLottoNum3;
    IBOutlet UIImageView *imgLottoNum4;
    IBOutlet UIImageView *imgLottoNum5;
    IBOutlet UIImageView *imgLottoNum6;
    IBOutlet UIButton *btnReload;
    IBOutlet UIButton *BtnBetDate;
    IBOutlet UIButton *btnSaveData;
    IBOutlet UIImageView *resultStar1;
    IBOutlet UIImageView *resultStar2;
    IBOutlet UIImageView *resultStar3;
    IBOutlet UIImageView *resultStar4;
    IBOutlet UIImageView *resultStar5;
    IBOutlet UILabel *lblResult;
    Lotto6SaveListViewController *lotto6SaveListViewControl;
    
}
@property (strong, nonatomic) IBOutlet UILabel *lblResult;
@property (strong, nonatomic) IBOutlet Lotto6SaveListViewController *lotto6SaveListViewControl;
@property (strong, nonatomic) IBOutlet  Lotto6ChangeDateController *lotto6ChangeDateControl;

-(IBAction)reload:(id)sender;
-(IBAction)loadViewChangeDate:(id)sender;
-(IBAction)saveData:(id)sender;
-(void) imgUpdate;

// touch method
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;

@end
