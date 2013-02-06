//
//  Lotto6SaveViewController.h
//  GoodLuck
//
//  Created by 이 재흥 on 12. 2. 2..
//  Copyright (c) 2012 하우스. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Lotto6SaveViewController : UITableViewController{
    IBOutlet UITableView *listTableView;
    NSArray *arryAppleProducts;
    NSArray *arryAdobeSoftwares;
}

@property (strong, nonatomic) IBOutlet UITableView *listTableView;

@end
