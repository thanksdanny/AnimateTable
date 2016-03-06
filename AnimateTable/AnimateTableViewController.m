//
//  AnimateTableViewController.m
//  AnimateTable
//
//  Created by Danny Ho on 3/7/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "AnimateTableViewController.h"
#import "SecondTableViewCell.h"

@interface AnimateTableViewController () <UITableViewDataSource,UITabBarControllerDelegate>

@property (strong, nonatomic) IBOutlet UITableView *secondTableView;

@end

@implementation AnimateTableViewController

#pragma mark - dataSource
- (void)viewDidLoad {
    [super viewDidLoad];
    self.secondTableView.dataSource = self;
    self.view.backgroundColor = [UIColor blackColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[SecondTableViewCell self] forCellReuseIdentifier:@"secondCell"]; // 因为这句才会初始化
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
    return @[@"Read 3 article on Medium",
             @"Cleanup bedroom",
             @"Go for a run",
             @"Hit the gym",
             @"Build another swift project",
             @"Movement training",
             @"Fix the layout problem of a client project",
             @"Write the experience of #30daysSwift",
             @"Inbox Zero",
             @"Booking the ticket to Chengdu",
             @"Test the Adobe Project Comet",
             @"Hop on a call to mom"];
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
    SecondTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"secondCell" forIndexPath:indexPath];
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


@end
