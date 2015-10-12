//
//  UIViewController+ViewModel.h
//  TestMVVM
//
//  Created by ajiao on 15/10/12.
//  Copyright © 2015年 ajiao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NSUInteger ViewControllerAction; //取别名

@interface UIViewController (ViewModel)

- (void)callBackAction;

- (void)callBackAction:(ViewControllerAction)action;

- (void)callBackAction:(ViewControllerAction)action info:(id)info;

@end
