//
//  ViewController.m
//  TableScrollAnimationDemo
//
//  Created by 胡晓阳 on 2016/9/28.
//  Copyright © 2016年 胡晓阳. All rights reserved.
//

#import "ViewController.h"
#import <PureLayout.h>

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *headerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    

    [self.view addSubview:self.tableView];
    [self.tableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
//    [self.tableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
    [self.tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
//    [self.tableView addSubview:self.backView];
//    [self.backView.superview sendSubviewToBack:self.backView];
    
//    [self.backView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(-100, 0, 0, 0)];
//    [self.backView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    
    [self.tableView setBackgroundView:self.backView];
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - self.tableView.contentInset.top - 2*44)];
    [footerView setBackgroundColor:[UIColor whiteColor]];
    [self.tableView setTableFooterView:footerView];
    
    

}

- (UIView *)backView{
    if (!_backView) {
        _backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 500)];
        [_backView setBackgroundColor:[UIColor redColor]];
        
//        
//        UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(-100, -100, [UIScreen mainScreen].bounds.size.width + 200, 300)];
//        [subView setBackgroundColor:[UIColor yellowColor]];
//        [_backView addSubview:subView];
    }
    return  _backView;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [_tableView setContentInset:UIEdgeInsetsMake(100, 0, 0, 0)];
//        [_tableView setBackgroundColor:[UIColor clearColor]];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        
        
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewViewDelegate & UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    [cell.textLabel setText:@"test"];
    return cell;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    NSLog(@"contentOffset:%f",scrollView.contentOffset.y);
//    if (scrollView.contentOffset.y > 0) {
//        [scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
//    }
//    [UIView autoSetPriority:999 forConstraints:^{
//        [self.tableView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:100 - scrollView.contentOffset.y];
//    }];
}


@end
