//
//  BaseViewModel.h
//  TestMVVM
//
//  Created by ajiao on 15/10/12.
//  Copyright © 2015年 ajiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BaseViewModel : NSObject

@property (nonatomic, strong) UIViewController *viewController;

+ (instancetype) modelWithViewController:(UIViewController *)viewController;

@end
