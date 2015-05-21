//
//  ViewController.m
//  dataShareWatchAndIphone
//
//  Created by 長尾聡一郎 on 2015/05/21.
//  Copyright (c) 2015年 長尾聡一郎. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)toggleAlabel {
    if(self.aLabel.hidden == YES){
        self.aLabel.hidden = NO;
    }
    else {
        self.aLabel.hidden = YES;
    }
    [self.aLabel setNeedsDisplay];
}

- (void)toggleBLabel {
    if(self.bLabel.hidden == YES){
        self.bLabel.hidden = NO;
    }
    else {
        self.bLabel.hidden = YES;
    }
    [self.bLabel setNeedsDisplay];
}
- (IBAction)testButton:(id)sender {
    [self toggleAlabel];
}

@end
