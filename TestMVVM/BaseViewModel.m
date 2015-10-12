//
//  BaseViewModel.m
//  TestMVVM
//
//  Created by ajiao on 15/10/12.
//  Copyright © 2015年 ajiao. All rights reserved.
//

#import "BaseViewModel.h"

@implementation BaseViewModel

+ (instancetype)modelWithViewController:(UIViewController *)viewController {
    BaseViewModel *model = self.new;
    if (model) {
        model.viewController = viewController;
    }
    return model;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"view model :%@ viewController:%@",super.description,self.viewController.description];
}

@end
