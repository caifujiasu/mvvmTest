//
//  ViewController.m
//  mvcTest
//
//  Created by sheng on 2016/10/11.
//  Copyright © 2016年 sheng. All rights reserved.
//

#import "ViewController.h"
#import "View.h"
#import "ViewModel.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *models;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 100;
    
    _models = [ViewModel viewModels];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.models.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   static NSString *str = @"cell";
    View *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[View alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        ViewModel *m = self.models[indexPath.row];
            cell.header.image = [UIImage imageWithContentsOfFile:m.url];
        cell.name.text = m.name;
        cell.content.text = m.content;
    }
    return cell;
}

@end
