//
//  CalculatorOperation.h
//  TestMVVM
//
//  Created by ajiao on 15/10/12.
//  Copyright © 2015年 ajiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CalculatorBrain.h"

@interface CalculatorOperation : NSObject

/**
 *  运算符，字符表示，暂时支持 + - * /
 */
@property (nonatomic,copy) NSString *operate;

/**
 *  操作数，记得用 float 转哦~
 */
@property (nonatomic,strong) NSNumber *number;

/**
 *  工厂方法，用于生产一个包含操作数与运算符的运算过程
 *
 *  @param number  操作数
 *  @param operate 运算符
 *
 */
+ (CalculatorOperation *)operationNumber:(NSNumber *)number operate:(NSString *)operate;

/**
 *  成功计算会返回运算后的值，运算如有问题则会返回 number 本身
 *
 */
- (NSNumber *)resultWithNumber:(NSNumber *)number;

@end
