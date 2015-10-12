//
//  UIViewController+ViewModel.m
//  TestMVVM
//
//  Created by ajiao on 15/10/12.
//  Copyright © 2015年 ajiao. All rights reserved.
//

#import "UIViewController+ViewModel.h"

@implementation UIViewController (ViewModel)

- (void)callBackAction{
    [self callBackAction:0 info:nil];
}

- (void)callBackAction:(ViewControllerAction)action{
    [self callBackAction:action info:nil];
}

- (void)callBackAction:(ViewControllerAction)action info:(id)info{
}

@end
