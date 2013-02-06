//
//  Lotto6ViewController.m
//  GoodLuck
//
//  Created by LEE.J.H (kagefree@me.com)
//  Copyright (c) 2012 softvalue.jp All rights reserved.
//

#import "Lotto6ViewController.h"
#import "Lotto6SaveListViewController.h"
#import "Lotto6ChangeDateController.h"
#import "Lotto6SelectNumber.h"
#import "Lotto6Util.h"
#import "Lotto6AppDelegate.h"
#import "CommonDateUtil.h"

@implementation Lotto6ViewController

@synthesize lblResult, lotto6SaveListViewControl, lotto6ChangeDateControl;

// 選択番号イメージを保持
UIImage *imgNum1;
UIImage *imgNum2;
UIImage *imgNum3;
UIImage *imgNum4;
UIImage *imgNum5;
UIImage *imgNum6;

// 毎回の選択番号を保持する配列(NSString)
NSMutableArray *selectedArry;
NSArray *sortedArray;
// 毎回の選択番号イメージを保持する配列(UIImage)
NSArray *svImgArry;
// 毎回の選択番号イメージビューを保持する配列(UIImageView)
NSArray *svImgViewArry;
int svNum6Int = 0;
NSMutableArray *startImgArr;
NSTimer *aniTimer;
NSString *currentDateString;
int stopAniCnt = 0;
int LIMIT_LOTTO_NUM = 44;
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/* -------------------------------------------------------------
 GoodLuckボタン押下処理
 ---------------------------------------------------------------- */
-(IBAction)reload:(id)sender{
    // ボタンを非活性
    btnReload.enabled = NO;
    NSString *tmpStr = NSLocalizedString(@"running", @"language that Need to be localized");
    [btnReload setTitle:tmpStr forState:(UIControlStateNormal)];
    //番号選択結果非表示
    lblResult.hidden = YES;
    btnSaveData.hidden = YES;    
    resultStar1.hidden = YES;
    resultStar2.hidden = YES;
    resultStar3.hidden = YES;
    resultStar4.hidden = YES;
    resultStar5.hidden = YES;
    
    // タイマー起動
    if(aniTimer != nil){
        [aniTimer invalidate];
    }
    aniTimer = [NSTimer scheduledTimerWithTimeInterval:0.6 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    
    for(int i=0; i<[svImgViewArry count]; i++){
        id imgViewId = [svImgViewArry objectAtIndex:i];
        ((UIImageView *)imgViewId).animationDuration = 5.0f;
        [((UIImageView *)imgViewId) startAnimating];
    }

    // ランダム数字６個を重複しないよう抽出
    //    地域情報
//    NSLocale *locale = [NSLocale currentLocale];
//    NSString* conCode = [locale objectForKey:NSLocaleCountryCode];
//    NSString* conName = [locale displayNameForKey:NSLocaleCountryCode value:conCode];
    //    言語情報
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray	*language = [defaults objectForKey:@"AppleLanguages"];
    NSString *currentLanguage = [language objectAtIndex:0];
    
    if([@"ko" isEqualToString:currentLanguage]){
        LIMIT_LOTTO_NUM = 46;
    }
    Lotto6SelectNumber *lottoSelectNum = [[Lotto6SelectNumber alloc] initWithRange:(LIMIT_LOTTO_NUM-1) andWithCheck:NO];
    selectedArry = [lottoSelectNum selectNum:6];
    svNum6Int = [lottoSelectNum calcStar:selectedArry flg:1];
    
    // ソート後NSArray抽出
    sortedArray = [selectedArry sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    [selectedArry addObjectsFromArray:sortedArray];
   
    // ----------------------------------------------------
    // LEVEL 評価
    // ----------------------------------------------------
    if(svNum6Int == 1){
        [resultStar1 setImage:[UIImage imageNamed:@"star_blank.png"]];
        [resultStar2 setImage:[UIImage imageNamed:@"star_blank.png"]];
        [resultStar3 setImage:[UIImage imageNamed:@"star_blank.png"]];
        [resultStar4 setImage:[UIImage imageNamed:@"star_blank.png"]];
        [resultStar5 setImage:[UIImage imageNamed:@"star_blank.png"]];
    }else if(svNum6Int == 2){
        [resultStar1 setImage:[UIImage imageNamed:@"star.png"]];
        [resultStar2 setImage:[UIImage imageNamed:@"star_blank.png"]];
        [resultStar3 setImage:[UIImage imageNamed:@"star_blank.png"]];
        [resultStar4 setImage:[UIImage imageNamed:@"star_blank.png"]];
        [resultStar5 setImage:[UIImage imageNamed:@"star_blank.png"]];
    }else if(svNum6Int == 3){
        [resultStar1 setImage:[UIImage imageNamed:@"star.png"]];
        [resultStar2 setImage:[UIImage imageNamed:@"star.png"]];
        [resultStar3 setImage:[UIImage imageNamed:@"star_blank.png"]];
        [resultStar4 setImage:[UIImage imageNamed:@"star_blank.png"]];
        [resultStar5 setImage:[UIImage imageNamed:@"star_blank.png"]];
    }else if(svNum6Int == 4){
        [resultStar1 setImage:[UIImage imageNamed:@"star.png"]];
        [resultStar2 setImage:[UIImage imageNamed:@"star.png"]];
        [resultStar3 setImage:[UIImage imageNamed:@"star.png"]];
        [resultStar4 setImage:[UIImage imageNamed:@"star_blank.png"]];
        [resultStar5 setImage:[UIImage imageNamed:@"star_blank.png"]];
    }else if(svNum6Int == 5){
        [resultStar1 setImage:[UIImage imageNamed:@"star.png"]];
        [resultStar2 setImage:[UIImage imageNamed:@"star.png"]];
        [resultStar3 setImage:[UIImage imageNamed:@"star.png"]];
        [resultStar4 setImage:[UIImage imageNamed:@"star.png"]];
        [resultStar5 setImage:[UIImage imageNamed:@"star_blank.png"]];
    }else if(svNum6Int == 0){
        [resultStar1 setImage:[UIImage imageNamed:@"star.png"]];
        [resultStar2 setImage:[UIImage imageNamed:@"star.png"]];
        [resultStar3 setImage:[UIImage imageNamed:@"star.png"]];
        [resultStar4 setImage:[UIImage imageNamed:@"star.png"]];
        [resultStar5 setImage:[UIImage imageNamed:@"star.png"]];
    }
    
    // ------- Lucky check(いったい何の処理かは知らない方が精神健康に良い) --------
    int tmpInt = [lottoSelectNum calcStar:selectedArry flg:0];
    if((tmpInt == svNum6Int) && (tmpInt == (tmpInt * svNum6Int) % 6)){
        [resultStar1 setImage:[UIImage imageNamed:@"star_gold.png"]];
        [resultStar2 setImage:[UIImage imageNamed:@"star_gold.png"]];
        [resultStar3 setImage:[UIImage imageNamed:@"star_gold.png"]];
        [resultStar4 setImage:[UIImage imageNamed:@"star_gold.png"]];
        [resultStar5 setImage:[UIImage imageNamed:@"star_gold.png"]];
    }
    // ------- Lucky check(いったい何の処理かは知らない方が精神健康に良い) --------
      
}


- (void) onTimer {
    [self imgUpdate];
    // and other stuff that happens onTimer
}

- (void) imgUpdate {
    if(stopAniCnt <= 5){
        id imgViewId = [svImgViewArry objectAtIndex:stopAniCnt];
        [(UIImageView *)imgViewId stopAnimating];
        
        id tmpNum = [sortedArray objectAtIndex:stopAniCnt];
        imgViewId = [svImgViewArry objectAtIndex:stopAniCnt];
        NSString *myString = [NSString stringWithFormat:@"ball_%i.png", [tmpNum intValue]];
        id imgId = [UIImage imageNamed:myString];
        [imgViewId setImage:imgId];

        stopAniCnt++;
    }else{
        //タイマー停止とアニメーションカウンタクリア
        [aniTimer invalidate];
        aniTimer = nil;
        stopAniCnt = 0;
        
        //番号選択結果表示
        lblResult.hidden = NO;
        btnSaveData.hidden = NO;    
        resultStar1.hidden = NO;
        resultStar2.hidden = NO;
        resultStar3.hidden = NO;
        resultStar4.hidden = NO;
        resultStar5.hidden = NO;
        //ボタン活性化
        [btnReload setTitle:@"Good Luck" forState:(UIControlStateNormal)];
        btnReload.enabled = YES;
    }
}

/* -------------------------------------------------------------
 保存一覧ボタン押下処理
 ---------------------------------------------------------------- */
-(void)loadViewList{
    [self.navigationController pushViewController:lotto6SaveListViewControl animated:YES];
}

/* -------------------------------------------------------------
 抽選日変更ボタン押下処理
 ---------------------------------------------------------------- */
-(IBAction)loadViewChangeDate:(id)sender{
    [self.navigationController pushViewController:lotto6ChangeDateControl animated:YES];
}

/* -------------------------------------------------------------
 保存ボタン押下処理
 ---------------------------------------------------------------- */
-(IBAction)saveData:(id)sender{
    // 表示中のロット数字をコアーデータに保存する。
    Lotto6AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    //先に件数制限チェック
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"SavedData" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    //    NSPredicate *pred = [NSPredicate predicateWithFormat:@"(name = %@)", name.text];
    //    [request setPredicate:pred];
    NSError *error;
    NSArray *loadDatas = [context executeFetchRequest:request error:&error];

    if([loadDatas count] > 50){
        UIAlertView *alert = [[UIAlertView alloc] init];
        alert.message = NSLocalizedString(@"warning01", @"language that Need to be localized");
        alert.title = @"GoodLuck6";
        [alert addButtonWithTitle:@"OK"];
        [alert show];
    }else{
        //コアーデータに保存
        context = [appDelegate managedObjectContext];
        NSManagedObject *newContact = [NSEntityDescription insertNewObjectForEntityForName:@"SavedData" inManagedObjectContext:context];
        [newContact setValue:currentDateString forKey:@"date"];
        [newContact setValue:@"1" forKey:@"date_seq"];
        [newContact setValue:[NSString stringWithFormat:@"%i", svNum6Int] forKey:@"starLevel"];
        [newContact setValue:[sortedArray objectAtIndex:0] forKey:@"num1"];
        [newContact setValue:[sortedArray objectAtIndex:1] forKey:@"num2"];
        [newContact setValue:[sortedArray objectAtIndex:2] forKey:@"num3"];
        [newContact setValue:[sortedArray objectAtIndex:3] forKey:@"num4"];
        [newContact setValue:[sortedArray objectAtIndex:4] forKey:@"num5"];
        [newContact setValue:[sortedArray objectAtIndex:5] forKey:@"num6"];
        [context save:&error];  // Core Data Commit
    
        UIAlertView *alert = [[UIAlertView alloc] init];
        if(error != nil){
    	// 保存失敗の場合
            alert.message = NSLocalizedString(@"warning03", @"language that Need to be localized");
        }else{
    	// データが保存された事を通知する。
            alert.message = NSLocalizedString(@"warning02", @"language that Need to be localized");
        }
        alert.title = @"GoodLuck6";
        [alert addButtonWithTitle:@"OK"];
        [alert show];
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"title01", @"language that Need to be localized");
    NSString *tmpBtnName = NSLocalizedString(@"btnName01", @"一覧");
    UIBarButtonItem *setBtn = [[UIBarButtonItem alloc] initWithTitle:tmpBtnName
                                                               style:UIBarButtonItemStylePlain
                                                              target:self
                                                              action:@selector(loadViewList)];  
    self.navigationItem.rightBarButtonItem = setBtn;
    
	// 基本数字イメージで初期化する。
    imgNum1 = [UIImage imageNamed:@"ball_1.png"];
    imgNum2 = [UIImage imageNamed:@"ball_2.png"];
    imgNum3 = [UIImage imageNamed:@"ball_3.png"];
    imgNum4 = [UIImage imageNamed:@"ball_4.png"];
    imgNum5 = [UIImage imageNamed:@"ball_5.png"];
    imgNum6 = [UIImage imageNamed:@"ball_6.png"];
    
    [imgLottoNum1 setImage:imgNum1];
    [imgLottoNum2 setImage:imgNum2];
    [imgLottoNum3 setImage:imgNum3];
    [imgLottoNum4 setImage:imgNum4];
    [imgLottoNum5 setImage:imgNum5];
    [imgLottoNum6 setImage:imgNum6];
    
    svImgArry = [[NSArray alloc] initWithObjects:imgNum1, imgNum2, imgNum3, imgNum4, imgNum5, imgNum6, nil];
    svImgViewArry = [[NSArray alloc] initWithObjects:imgLottoNum1, imgLottoNum2, imgLottoNum3, imgLottoNum4, imgLottoNum5, imgLottoNum6, nil];
    
    // 起動アニメーション
    startImgArr = [[NSMutableArray alloc] init];
    for(int i=1; i<LIMIT_LOTTO_NUM; i++){
        [startImgArr addObject:[UIImage imageNamed:[NSString stringWithFormat:@"ball_%i.png", i]]];
    }
    
    for(int i=0; i<[svImgViewArry count]; i++){
        id imgViewId = [svImgViewArry objectAtIndex:i];
        ((UIImageView *)imgViewId).animationImages = startImgArr;
        ((UIImageView *)imgViewId).animationDuration = 0.8f;
        ((UIImageView *)imgViewId).animationRepeatCount = 1;
        [((UIImageView *)imgViewId) startAnimating];
    }
    
    lblResult.hidden = YES;
    btnSaveData.hidden = YES;
    resultStar1.hidden = YES;
    resultStar2.hidden = YES;
    resultStar3.hidden = YES;
    resultStar4.hidden = YES;
    resultStar5.hidden = YES;
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    selectedArry = nil;
    svImgArry = nil;
    svImgViewArry = nil;
    imgNum1 = nil;
    imgNum2 = nil;
    imgNum3 = nil;
    imgNum4 = nil;
    imgNum5 = nil;
    imgNum6 = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    NSString *tmpStr = NSLocalizedString(@"label01", @"抽選日  ");
    NSString *formatStr = @"yyyy / MM / dd  EEEE";
    // 地域情報
//    NSLocale *locale = [NSLocale currentLocale];
//    NSString* conCode = [locale objectForKey:NSLocaleCountryCode];
//    NSString* conName = [locale displayNameForKey:NSLocaleCountryCode value:conCode];
    // 言語情報
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray	*language = [defaults objectForKey:@"AppleLanguages"];
    NSString *currentLanguage = [language objectAtIndex:0];
    NSLocale *locale = nil;
    if([@"ko" isEqualToString:currentLanguage]){
        formatStr = @"yyyy년MM월dd일  EEEE";
        locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ko_KR"];
    }else if([@"ja" isEqualToString:currentLanguage]){
        formatStr = @"yyyy年MM月dd日  EEEE";
        locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"];
    }
    
    if(lotto6ChangeDateControl.selectedDate == nil){
        currentDateString = [CommonDateUtil getDateToString:[CommonDateUtil getCurrentDate] andWithFormat:formatStr andWithLocale:locale];
    }else{
        currentDateString = [CommonDateUtil getDateToString:lotto6ChangeDateControl.selectedDate andWithFormat:formatStr andWithLocale:locale];
    }
    currentDateString  =[tmpStr stringByAppendingString:currentDateString];
    [BtnBetDate setTitle:currentDateString forState:(UIControlStateNormal)];
    BtnBetDate.titleLabel.text = currentDateString;

    [super viewDidAppear:animated];
    //シェイクのため
    [self becomeFirstResponder];    
    
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    // return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    return NO;	// InterfaceOrientation不許
}


// touch method
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    lblResult.text = @"Began";
}

// touch method
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
//    lblResult.text = @"Ended";
}

// touch method
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
//    lblResult.text = @"Moved";
}

-(BOOL)canBecomeFirstResponder {
    return YES;
}
// 사용자의 흔들기 모션이 시작되면 실행
-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    [self reload:nil];
}
// 사용자의 흠들기 모션이 시작되고 종료되면 실행
-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
//    NSLog(@"흔들기 종료!");
}
//지나치게 많이 흔들거나 유효하지 않는 흔들기로 판단될때 실
-(void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
//    NSLog(@"흔들기 실패!");
}

@end
