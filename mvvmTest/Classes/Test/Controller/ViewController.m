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
#import "ZSWeatherService.h"

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


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    ZSWeatherService *weather = [ZSWeatherService new];
//    weather.city = @"beijing";
//    [weather requestGET:YES url:@"http://apis.baidu.com/heweather/weather/free" resultBlcok:^(id data, NSError *error) {
//
//        if (!error) {
//            NSLog(@"%@",error);
//        }else{
//            NSLog(@"%@",data);
//        }
//    }];

    NSURL *url = [NSURL URLWithString:@"http://www.daka.com/login"]  ;
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [@"username=daka&pwd=123" dataUsingEncoding:NSUTF8StringEncoding];
    [request setValue: @"1111" forHTTPHeaderField:@"Connection"];
    [request setValue:@"gzip,deflate,sdch" forHTTPHeaderField:@"Accept-Encoding"];
    [request setValue:@"1111" forHTTPHeaderField:@"Accept-Language"];

    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    config.HTTPAdditionalHeaders = @{@"Connection":@"close"};

    NSLog(@"%@",request.allHTTPHeaderFields);
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    // 由于要先对request先行处理,我们通过request初始化task
    NSURLSessionTask *task = [session dataTaskWithRequest:request
                                        completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) { NSLog(@"%@", [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil]); }];
    [task resume];
    
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
