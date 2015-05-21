//
//  ViewController.h
//  dataShareWatchAndIphone
//
//  Created by 長尾聡一郎 on 2015/05/21.
//  Copyright (c) 2015年 長尾聡一郎. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (void)toggleAlabel;
- (void)toggleBLabel;
@property (weak, nonatomic) IBOutlet UILabel *aLabel;
@property (weak, nonatomic) IBOutlet UILabel *bLabel;

@end

