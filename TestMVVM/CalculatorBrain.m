//
//  CalculatorBrain.m
//  TestMVVM
//
//  Created by ajiao on 15/10/12.
//  Copyright © 2015年 ajiao. All rights reserved.
//

#import "CalculatorBrain.h"
#import "CalculatorOperation.h"

@interface CalculatorBrain ()
@property (nonatomic, strong, readwrite) NSMutableArray *operations;
@property (nonatomic, strong, readwrite) NSNumber *currentNumber;
@property (nonatomic, copy) NSString *lastOperate;
@property (nonatomic,assign) BOOL shouldCalculate;//是否点击了操作按钮

@end

@implementation CalculatorBrain

+ (CalculatorBrain *)brain {
    
    static CalculatorBrain *brain = nil;
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken, ^{
        brain = [CalculatorBrain new];
    });
    return brain;
}

//新增一个数字
- (void)addSuffixNumber:(NSNumber *)number {

    if (!number) {
        return;
    }
    
    if (self.shouldCalculate) {
        self.currentNumber = nil;
        self.shouldCalculate = NO;
    }
    
    self.currentNumber = @(self.currentNumber.integerValue * 10 + number.integerValue);
    
    if ([self.displayDelegate respondsToSelector:@selector(calculator:didChangeCurrentNumber:)]) {
        [self.displayDelegate calculator:self didChangeCurrentNumber:self.currentNumber];
    }
}


//新增一个操作符，同时意味着上一个数字结束
- (void)addOperate:(NSString *)operate{
    self.shouldCalculate = YES;
    //生产operation 时间做了默认值处理
    CalculatorOperation *operation  = [CalculatorOperation operationNumber:self.currentNumber ? : @(0) operate:self.lastOperate ? self.lastOperate : @"aa"];
    [self addOperation:operation];
    
    self.lastOperate = operate;
    
    if ([self.displayDelegate respondsToSelector:@selector(calculator:didAddOperate:)]) {
        [self.displayDelegate calculator:self didAddOperate:operate];
    }
}
//删除最后一个运算步骤
- (void)removeLastOperation{
    if (self.operations.firstObject) {
        [self.operations removeObjectAtIndex:0];
    }
    self.shouldCalculate = YES;
}

//清空运算步骤
- (void)clearOperations{
    self.operations = nil;
    self.currentNumber = @(0);
    self.lastOperate = nil;
    if ([self.displayDelegate respondsToSelector:@selector(calculator:didChangeCurrentNumber:)]) {
        [self.displayDelegate calculator:self didChangeCurrentNumber:self.currentNumber];
    }
}

////当前步骤下的运算结果，如果当前没有任何步骤，则返回 Nil
- (NSNumber *)result {
    if (!self.operations.count) {
        return nil;
    }
    __block NSNumber *result = @(0);
    //顺序遍历
//    [self.operations enumerateObjectsUsingBlock:^(CalculatorOperation *operation , NSUInteger idx, BOOL *stop) {
//        result = [operation resultWithNumber:result];
//    }];
    
     //倒序遍历
    [self.operations enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(CalculatorOperation *operation , NSUInteger idx, BOOL *stop) {
        result = [operation resultWithNumber:result];
    }];
    return result;
}

//结果展示
- (NSString *)displayString {
    if (self.shouldCalculate) {
        return self.result.stringValue? : @"0";
    } else {
        return self.currentNumber.stringValue ? : @"0";
    }
}


//私有方法
- (void)addOperation:(CalculatorOperation *)operation {
    if (!self.operations) {
        self.operations = [NSMutableArray array];
    }
    [self.operations insertObject:operation atIndex:0];
}

@end
