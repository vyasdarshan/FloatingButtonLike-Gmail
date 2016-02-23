//
//  MEVExample1ViewController.m
//  MEVFloatingButton
//
//  Created by Manuel Escrig Ventura on 09/02/16.
//  Copyright © 2016 Manuel Escrig Ventura. All rights reserved.
//

#import "MEVExample1ViewController.h"
#import "UIScrollView+FloatingButton.h"

static NSString *CellIdentifier = @"CellIdentifier";

@interface MEVExample1ViewController () <MEVFloatingButtonDelegate>

@end

@implementation MEVExample1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Example 1";

    MEVFloatingButton *button = [[MEVFloatingButton alloc] init];
    button.animationType = MEVFloatingButtonAnimationNone;
    button.displayMode = MEVFloatingButtonDisplayModeAlways;
    button.position = MEVFloatingButtonPositionBottomRight;
    button.image = [UIImage imageNamed:@"Icon1"];
    button.imageColor = [UIColor blackColor];
    button.backgroundColor = [UIColor redColor];
    button.outlineColor = [UIColor blackColor];
    button.outlineWidth = 3.0f;
    button.imagePadding = 20.0f;
    button.horizontalOffset = -30.0f;
    button.verticalOffset = -30.0f;
    button.rounded = YES;
    button.shadowColor = [UIColor lightGrayColor];
    button.shadowOffset = CGSizeMake(3, 3);
    button.shadowOpacity = 0.6f;
    button.shadowRadius = 3.0f;
    [self.tableView setFloatingButtonView:button];
    [self.tableView setFloatingButtonDelegate:self];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.textLabel.text = [NSString stringWithFormat:@"Cell section [%zd] row [%zd]", indexPath.section, indexPath.row];
    return cell;
}


#pragma mark - MEScrollToTopDelegate Methods

- (void)floatingButton:(UIScrollView *)scrollView didTapButton:(UIButton *)button {
    NSLog(@"didTapButton");
    [self.tableView setContentOffset:CGPointMake(0, -self.tableView.contentInset.top) animated:YES];
}

- (void)floatingButtonWillAppear:(UIScrollView *)scrollView {
    NSLog(@"floatingButtonWillAppear");
}

- (void)floatingButtonDidAppear:(UIScrollView *)scrollView {
    NSLog(@"floatingButtonDidAppear");
}

- (void)floatingButtonWillDisappear:(UIScrollView *)scrollView {
    NSLog(@"floatingButtonWillDisappear");
}

- (void)floatingButtonDidDisappear:(UIScrollView *)scrollView; {
    NSLog(@"floatingButtonDidDisappear");
}

@end