//
//  TopViewModel.m
//  TestMVVM
//
//  Created by ajiao on 15/10/12.
//  Copyright © 2015年 ajiao. All rights reserved.
//

#import "TopViewModel.h"
#import "CalculatorBrain.h"

@interface TopViewModel () <CalculatorDisplayDelegate>

- (CalculatorBrain *)calculatorBrain;

@end

@implementation TopViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.calculatorBrain.displayDelegate = self;
    }
    return self;
}

- (NSString *)LEDString {
    return self.calculatorBrain.displayString;
}

- (NSUInteger)operationCount {
    return self.calculatorBrain.operations.count;
}

- (NSString *)operationTextAtIndex:(NSUInteger)index {
    return [self.calculatorBrain.operations[index]description];
}

- (void)undo {
    [self.calculatorBrain removeLastOperation];
    [self.viewController callBackAction:TopViewCallBackActionReloadResult | TopViewCallBackActionReloadTableView];
}

- (void)clear {
    [self.calculatorBrain clearOperations];
    [self.viewController callBackAction:TopViewCallBackActionReloadResult | TopViewCallBackActionReloadTableView];
}

#pragma mark - delegate
- (void)calculator:(id)brain didAddOperate:(NSString *)operate {

    [self.viewController callBackAction:TopViewCallBackActionReloadResult | TopViewCallBackActionReloadTableView];
}

- (void)calculator:(CalculatorBrain *)brain didChangeCurrentNumber:(NSNumber *)number {
    
    [self.viewController callBackAction:TopViewCallBackActionReloadResult];
}

#pragma getter方法
- (CalculatorBrain*)calculatorBrain {
    return [CalculatorBrain brain];
}

@end
