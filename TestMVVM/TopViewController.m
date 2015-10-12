//
//  TopViewController.m
//  TestMVVM
//
//  Created by ajiao on 15/10/12.
//  Copyright © 2015年 ajiao. All rights reserved.
//

#import "TopViewController.h"
#import "TopViewModel.h"

@interface TopViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *operationTableView;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (nonatomic,strong) TopViewModel *model;
@end

@implementation TopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.model = [TopViewModel modelWithViewController:self];
    
}

- (IBAction)undo:(UIButton *)sender {
    [self.model undo];
}

- (IBAction)clear:(UIButton *)sender {
    [self.model clear];
}

- (void)callBackAction:(ViewControllerAction)action{
    if (action & TopViewCallBackActionReloadTableView) {
        [self.operationTableView reloadData];
    }
    if (action & TopViewCallBackActionReloadResult) {
        self.resultLabel.text = self.model.LEDString;
    }
}

#pragma mark - tableView datasource & delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.model.operationCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [self.model operationTextAtIndex:indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
