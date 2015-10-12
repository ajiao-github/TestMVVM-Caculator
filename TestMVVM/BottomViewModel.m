//
//  BottomViewModel.m
//  TestMVVM
//
//  Created by ajiao on 15/10/12.
//  Copyright © 2015年 ajiao. All rights reserved.
//

#import "BottomViewModel.h"
#import "CalculatorBrain.h"

@implementation BottomViewModel

- (void)setNumber:(NSNumber *)number{
    [[CalculatorBrain brain] addSuffixNumber:number];
}

- (void)setOperate:(NSString *)operate{
    [[CalculatorBrain brain] addOperate:operate];
}


@end
