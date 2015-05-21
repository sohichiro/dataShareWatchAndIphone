//
//  ViewController.m
//  dataShareWatchAndIphone
//
//  Created by 長尾聡一郎 on 2015/05/21.
//  Copyright (c) 2015年 長尾聡一郎. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()


@end

static NSString* const ktoggleA = @"toggleA";
static NSString* const ktoggleB = @"toggleB";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toggleAlabel) name:ktoggleA object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toggleBLabel) name:ktoggleB object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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

@end
