//
//  InterfaceController.m
//  dataShareWatchAndIphone WatchKit Extension
//
//  Created by 長尾聡一郎 on 2015/05/21.
//  Copyright (c) 2015年 長尾聡一郎. All rights reserved.
//

#import "InterfaceController.h"

#define COMMAND @"command"
#define PUSHA @"pushA"
#define PUSHB @"pushB"
#define REPPHONE @"repPhone"

@interface InterfaceController()
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *infoLabel;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.

}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    self.infoLabel.text = @"start";
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}
- (IBAction)pushAbutton {
    NSDictionary* dic = @{COMMAND:PUSHA};
    [WKInterfaceController openParentApplication:dic reply:^(NSDictionary *replyInfo, NSError *error) {
        if(replyInfo){
            if([replyInfo[REPPHONE] isEqualToString:PUSHA]){
                //replyInfoの確認
                for (id key in [replyInfo keyEnumerator]){
                    NSLog(@"replyInfo::key = %@ value = %@",key, [replyInfo valueForKey:key]);
                    
                }
                //infolabelの更新
                self.infoLabel.text = @"toggle by A";
            }
        }
        else {
            //エラー
        }
    }];
    
}

- (IBAction)pushBbutton {
    NSDictionary* dic = @{COMMAND:PUSHB};
    [WKInterfaceController openParentApplication:dic reply:^(NSDictionary *replyInfo, NSError *error) {
        if(replyInfo){
            if([replyInfo[REPPHONE] isEqualToString:PUSHB]){
                //replyInfoの確認
                for (id key in [replyInfo keyEnumerator]){
                    NSLog(@"replyInfo::key = %@ value = %@",key, [replyInfo valueForKey:key]);
                    
                }
                //infolabelの更新
                self.infoLabel.text = @"toggle by B";
            }
        }
        else {
            //エラー
        }
    }];
}

@end



