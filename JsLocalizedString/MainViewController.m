//
//  MainViewController.m
//  JsLocalizedString
//
//  Created by JS Lim on 6/29/13.
//  Copyright (c) 2013 Js Lim. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationItem.title = JSLocalizedString(@"Title", @"Localized bar title: Title");
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:JSLocalizedString(@"Setting", @"Localized bar button title: Setting") style:UIBarButtonItemStylePlain target:self action:@selector(settingTouched:)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)settingTouched:(UIBarButtonItem *)sender
{
    SettingViewController *controller = [[SettingViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
