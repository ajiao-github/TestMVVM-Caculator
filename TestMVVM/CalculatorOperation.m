//
//  CalculatorOperation.m
//  TestMVVM
//
//  Created by ajiao on 15/10/12.
//  Copyright © 2015年 ajiao. All rights reserved.
//

#import "CalculatorOperation.h"

@implementation CalculatorOperation

+ (CalculatorOperation *)operationNumber:(NSNumber *)number operate:(NSString *)operate {
    CalculatorOperation *operation = self.new;
    if (operation) {
        operation.number = number;
        operation.operate = operate;
    }
    return operation;
}


- (NSNumber *)resultWithNumber:(NSNumber *)number {//number是上次的最众结果
    NSLog(@"====%@",self.operate);
    if ([self.operate isEqualToString:@"+"]) {
        return @(number.floatValue + self.number.floatValue);
    } else if ([self.operate isEqualToString:@"-"]) {
        return @(number.floatValue - self.number.floatValue);
    }else if([self.operate isEqualToString:@"*"]){
        return @(number.floatValue * self.number.floatValue);
    }else if([self.operate isEqualToString:@"/"]){
        if ([self.number isEqualToNumber:@(0)]) {
            return number;
        }
        return @(number.floatValue / self.number.floatValue);
    } else {
        NSLog(@"unknown operator:%@",self.operate);
        return self.number;
    }
}

//这里这么做是个 trick ，其实会妨碍调试，因为不再显示内存地址
- (NSString *)description{
    return [NSString stringWithFormat:@"%@%@",self.operate,self.number];
}

@end
