//
//  TopViewModel.h
//  TestMVVM
//
//  Created by ajiao on 15/10/12.
//  Copyright © 2015年 ajiao. All rights reserved.
//

#import "BaseViewModel.h"
#import "UIViewController+ViewModel.h"

//这里的ViewControllerAction相当于NSUInteger
typedef NS_ENUM(ViewControllerAction, TopViewCallBackAction) {
    
    TopViewCallBackActionReloadTableView = 1 << 0,
    TopViewCallBackActionReloadResult = 1 << 1
};

//<<左移运算符 左移一位，相当于扩大2倍
//|位或运算符 按二进制存储数据的位进行或运算，有1则1，全0为0
//a=(0<<2)|(1<<3) 中有括号，先运算括号中的表达式
//0<<2 结果还是0
//1<<3 结果为1*2*2*2=8
//0|8=8
//所以结果为：a= 8

@interface TopViewModel : BaseViewModel

- (NSString *)LEDString;

- (NSUInteger)operationCount;

- (NSString *)operationTextAtIndex:(NSUInteger)index;

- (void)undo;

- (void)clear;

@end
