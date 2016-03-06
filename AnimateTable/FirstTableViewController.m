//
//  FirstTableViewController.m
//  AnimateTable
//
//  Created by Danny Ho on 3/7/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "FirstTableViewController.h"
#import "FirstTableViewCell.h"

@interface FirstTableViewController () <UITableViewDataSource,UITabBarControllerDelegate>

@property (strong, nonatomic) IBOutlet UITableView *firstTableView;

@end

@implementation FirstTableViewController

#pragma mark - dataSource
- (void)viewDidLoad {
    [super viewDidLoad];
    self.firstTableView.dataSource = self;
    self.view.backgroundColor = [UIColor blackColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[FirstTableViewCell self] forCellReuseIdentifier:@"firstCell"]; // 因为这句才会初始化
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

#pragma mark - data

- (NSArray *)data {
    return @[@"Personal Life",
             @"Buddy Company",
             @"#30 days Swift Project",
             @"Body movement training",
             @"AppKitchen Studio",
             @"Project Read",
             @"Others"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  [[self data] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"firstCell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [self data][indexPath.row]];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.textLabel.font = [UIFont fontWithName:@"Aenir Next" size:18];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.backgroundColor = [self colorForIndex:indexPath.row];
}

- (UIColor *)colorForIndex:(NSInteger)index {
    CGFloat itemCount = [[self data] count] - 1; // 果然是这个算法问题，导致颜色出不来，把itemCount的类型写成NSInteger
    CGFloat color = (index / itemCount) * 0.6;
    
    return [UIColor colorWithRed:1.0 green:color blue:0.0 alpha:1.0];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"ShowAnimateTableViewController" sender:nil];
}

@end