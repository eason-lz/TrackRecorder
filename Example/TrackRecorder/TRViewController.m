//
//  TRViewController.m
//  TrackRecorder
//
//  Created by 18210437675@163.com on 09/19/2019.
//  Copyright (c) 2019 18210437675@163.com. All rights reserved.
//

#import "TRViewController.h"
#import "PageViewController.h"
#import "ControlViewController.h"
#import "TableViewController.h"
#import "CollectionViewController.h"
#import "TapViewController.h"

@interface TRViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"TrackRecorder";
    self.view.backgroundColor = [UIColor whiteColor];
    // 页面访问，点击，tableview，collectionview，手势
    
    UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height) style:UITableViewStyleGrouped];
    tableview.delegate = self;
    tableview.dataSource = self;
    [self.view addSubview:tableview];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableviewCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"tableviewCell"];
    }
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"页面访问";
            break;
        case 1:
        cell.textLabel.text = @"点击";
            break;
        case 2:
        cell.textLabel.text = @"tableview";
            break;
        case 3:
        cell.textLabel.text = @"collectionview";
            break;
        case 4:
        cell.textLabel.text = @"手势";
            break;
        default:
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        {
            PageViewController *vc = [[PageViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            ControlViewController *vc = [[ControlViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:
        {
            TableViewController *vc = [[TableViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3:
        {
            CollectionViewController *vc = [[CollectionViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 4:
        {
            TapViewController *vc = [[TapViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}

@end
