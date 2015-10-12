//
//  CalculatorBrain.h
//  TestMVVM
//
//  Created by ajiao on 15/10/12.
//  Copyright © 2015年 ajiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CalculatorBrain;

@protocol CalculatorDisplayDelegate <NSObject>

@optional

- (void)calculator:(CalculatorBrain *)brain didChangeCurrentNumber:(NSNumber *)number;
- (void)calculator:(id)brain didAddOperate:(NSString *)operate;

@end

@interface CalculatorBrain : NSObject

@property (nonatomic, strong,readonly) NSMutableArray *operations;//存放计算过程
@property (nonatomic, weak) id <CalculatorDisplayDelegate> displayDelegate;

+ (CalculatorBrain *)brain;
//新增一个数字
- (void)addSuffixNumber:(NSNumber *)number;
//新增一个操作符，同时意味着上一个数字结束
- (void)addOperate:(NSString *)operate;
//删除最后一个运算步骤
- (void)removeLastOperation;
//清空运算步骤
- (void)clearOperations;
//当前步骤下的运算结果，如果当前没有任何步骤，则返回 Nil
- (NSNumber *)result;
- (NSString *)displayString;


@end
