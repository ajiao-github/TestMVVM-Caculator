//
//  BottomViewController.m
//  TestMVVM
//
//  Created by ajiao on 15/10/12.
//  Copyright © 2015年 ajiao. All rights reserved.
//

#import "BottomViewController.h"
#import "BottomViewModel.h"
#import "CalculatorBrain.h"

@interface BottomViewController ()

@property(nonatomic, strong) BottomViewModel *model;

@end

@implementation BottomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.model = [BottomViewModel modelWithViewController:self];
}

- (IBAction)number:(UIButton*)sender {
    NSLog(@"%@",sender.titleLabel.text);
    [self.model setNumber:@(sender.titleLabel.text.integerValue)];
}

- (IBAction)operator:(UIButton *)sender {
    [self.model setOperate:sender.titleLabel.text];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
