//
//  Lotto6SaveViewController.m
//  GoodLuck
//
//  Created by LEE.J.H (kagefree@me.com)
//  Copyright (c) 2012 softvalue.jp All rights reserved.
//

#import "Lotto6SaveListViewController.h"
#import "Lotto6Util.h"
#import "Lotto6AppDelegate.h"
#import "CustomCell.h"
#import "Lotto6SelectNumber.h"

@implementation Lotto6SaveListViewController

@synthesize listTableView;

NSArray *loadDatas;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
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
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    // コーアーデータロード
    Lotto6AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"SavedData" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    //    NSPredicate *pred = [NSPredicate predicateWithFormat:@"(name = %@)", name.text];
    //    [request setPredicate:pred];
    NSError *error;
    loadDatas = [context executeFetchRequest:request error:&error];
    
    // ビュー再ロード
//    [self.tableView beginUpdates];
//    [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:YES];
//    [self.tableView insertSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:YES];
//    [self.tableView endUpdates];
    // ビュー再ロード
    [self.tableView reloadData];
    
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //    return [loadDic count];
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	
	return [loadDatas count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    CustomCell *cell = nil;
    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Set up the cell...
    
    NSManagedObject *matches = [loadDatas objectAtIndex:indexPath.row];
    if([matches valueForKey:@"date"] == nil){
        return cell;    //余計なデータが入ったらスキップ
    }
    cell.detailTextLabel.text = [matches valueForKey:@"date"];
    cell.textLabel.text = @" ";
    int numLevel =  [[matches valueForKey:@"starLevel"] intValue];
    int num1 =  [[matches valueForKey:@"num1"] intValue];
    int num2 =  [[matches valueForKey:@"num2"] intValue];
    int num3 =  [[matches valueForKey:@"num3"] intValue];
    int num4 =  [[matches valueForKey:@"num4"] intValue];
    int num5 =  [[matches valueForKey:@"num5"] intValue];
    int num6 =  [[matches valueForKey:@"num6"] intValue];
    
    [cell.imgLottoNum1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"ball_%i.png", num1]]];
    [cell.imgLottoNum2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"ball_%i.png", num2]]];
    [cell.imgLottoNum3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"ball_%i.png", num3]]];
    [cell.imgLottoNum4 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"ball_%i.png", num4]]];
    [cell.imgLottoNum5 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"ball_%i.png", num5]]];
    [cell.imgLottoNum6 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"ball_%i.png", num6]]];

    // ----------------------------------------------------
    // LEVEL 評価
    // ----------------------------------------------------
    //    unsigned int numInts[] = {   
    //        [[sortedArray objectAtIndex:0] intValue],
    //        [[sortedArray objectAtIndex:1] intValue],
    //        [[sortedArray objectAtIndex:2] intValue],
    //        [[sortedArray objectAtIndex:3] intValue],
    //        [[sortedArray objectAtIndex:4] intValue],
    //        [[sortedArray objectAtIndex:5] intValue]
    //    };
    //    
    //    if(check_ng_pattern(numInts)){ // C関数呼び出す
    //        [resultStar1 setImage:[UIImage imageNamed:@"star_blank.png"]];
    //        [resultStar2 setImage:[UIImage imageNamed:@"star_blank.png"]];
    //        [resultStar3 setImage:[UIImage imageNamed:@"star_blank.png"]];
    //        [resultStar4 setImage:[UIImage imageNamed:@"star_blank.png"]];
    //        [resultStar5 setImage:[UIImage imageNamed:@"star_blank.png"]];
    //    }else 
   
    // 結果表示
    if(numLevel == 1){
        [cell.imgStar1 setImage:[UIImage imageNamed:@"star_blank.png"]];
        [cell.imgStar2 setImage:[UIImage imageNamed:@"star_blank.png"]];
        [cell.imgStar3 setImage:[UIImage imageNamed:@"star_blank.png"]];
        [cell.imgStar4 setImage:[UIImage imageNamed:@"star_blank.png"]];
        [cell.imgStar5 setImage:[UIImage imageNamed:@"star_blank.png"]];
    }else if(numLevel == 2){
        [cell.imgStar1 setImage:[UIImage imageNamed:@"star.png"]];
        [cell.imgStar2 setImage:[UIImage imageNamed:@"star_blank.png"]];
        [cell.imgStar3 setImage:[UIImage imageNamed:@"star_blank.png"]];
        [cell.imgStar4 setImage:[UIImage imageNamed:@"star_blank.png"]];
        [cell.imgStar5 setImage:[UIImage imageNamed:@"star_blank.png"]];
    }else if(numLevel == 3){
        [cell.imgStar1 setImage:[UIImage imageNamed:@"star.png"]];
        [cell.imgStar2 setImage:[UIImage imageNamed:@"star.png"]];
        [cell.imgStar3 setImage:[UIImage imageNamed:@"star_blank.png"]];
        [cell.imgStar4 setImage:[UIImage imageNamed:@"star_blank.png"]];
        [cell.imgStar5 setImage:[UIImage imageNamed:@"star_blank.png"]];
    }else if(numLevel == 4){
        [cell.imgStar1 setImage:[UIImage imageNamed:@"star.png"]];
        [cell.imgStar2 setImage:[UIImage imageNamed:@"star.png"]];
        [cell.imgStar3 setImage:[UIImage imageNamed:@"star.png"]];
        [cell.imgStar4 setImage:[UIImage imageNamed:@"star_blank.png"]];
        [cell.imgStar5 setImage:[UIImage imageNamed:@"star_blank.png"]];
    }else if(numLevel == 5){
        [cell.imgStar1 setImage:[UIImage imageNamed:@"star.png"]];
        [cell.imgStar2 setImage:[UIImage imageNamed:@"star.png"]];
        [cell.imgStar3 setImage:[UIImage imageNamed:@"star.png"]];
        [cell.imgStar4 setImage:[UIImage imageNamed:@"star.png"]];
        [cell.imgStar5 setImage:[UIImage imageNamed:@"star_blank.png"]];
    }else if(numLevel == 0){
        [cell.imgStar1 setImage:[UIImage imageNamed:@"star.png"]];
        [cell.imgStar2 setImage:[UIImage imageNamed:@"star.png"]];
        [cell.imgStar3 setImage:[UIImage imageNamed:@"star.png"]];
        [cell.imgStar4 setImage:[UIImage imageNamed:@"star.png"]];
        [cell.imgStar5 setImage:[UIImage imageNamed:@"star.png"]];
    }
    
    // ------- Lucky check(いったい何の処理かは知らない方が精神健康に良い) --------
    Lotto6SelectNumber *lottoSelectNum = [[Lotto6SelectNumber alloc] initWithRange:43 andWithCheck:NO];
    NSMutableArray *tmpArray = [[NSMutableArray alloc] init];
    [tmpArray addObject:[matches valueForKey:@"num1"]];
    [tmpArray addObject:[matches valueForKey:@"num2"]];
    [tmpArray addObject:[matches valueForKey:@"num3"]];
    [tmpArray addObject:[matches valueForKey:@"num4"]];
    [tmpArray addObject:[matches valueForKey:@"num5"]];
    [tmpArray addObject:[matches valueForKey:@"num6"]];
    int tmpInt = [lottoSelectNum calcStar:tmpArray flg:0];
    if((tmpInt == numLevel) && (tmpInt == (tmpInt * numLevel) % 6)){
        [cell.imgStar1 setImage:[UIImage imageNamed:@"star_gold.png"]];
        [cell.imgStar2 setImage:[UIImage imageNamed:@"star_gold.png"]];
        [cell.imgStar3 setImage:[UIImage imageNamed:@"star_gold.png"]];
        [cell.imgStar4 setImage:[UIImage imageNamed:@"star_gold.png"]];
        [cell.imgStar5 setImage:[UIImage imageNamed:@"star_gold.png"]];
    }
    // ------- Lucky check(いったい何の処理かは知らない方が精神健康に良い) --------

    return cell;    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
	
    return NSLocalizedString(@"title02", @"language that Need to be localized");;
}


 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
// Return NO if you do not want the specified item to be editable.
 return YES;
 }



 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //該当コーアーデータ検索
        Lotto6AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        NSManagedObjectContext *context = [appDelegate managedObjectContext];
        NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"SavedData" inManagedObjectContext:context];
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        [request setEntity:entityDesc];
        NSError *error;
        loadDatas = [context executeFetchRequest:request error:&error];
        //該当オブジェクト削除
        NSManagedObject *matches = [loadDatas objectAtIndex:indexPath.row];
        [context deleteObject:matches]; // Core Date Delete
        [context save:&error];  // Core Date Commit
        //削除後コーアーデータリロード
        loadDatas = [context executeFetchRequest:request error:&error];
        
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
     }else if (editingStyle == UITableViewCellEditingStyleInsert) {
         // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }   
 }

 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {

 }

 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (CGFloat) tableView : (UITableView *) tableView heightForRowAtIndexPath: (NSIndexPath *) indexPath {
    
    
    return 70;
}

@end



