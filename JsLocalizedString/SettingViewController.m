//
//  SettingViewController.m
//  JsLocalizedString
//
//  Created by JS Lim on 6/29/13.
//  Copyright (c) 2013 Js Lim. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation SettingViewController

@synthesize tableView = _tableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = JSLocalizedString(@"Settings", @"Localized bar title: Settings");
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleTopMargin;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [theTableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [[[UIAlertView alloc] initWithTitle:@"Language Options" message:@"Select a language" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"English", @"中文", nil] show];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return JSLocalizedString(@"Language", @"TableView header title: Language");
}

- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"SettingCell";
    
    UITableViewCell *cell = [theTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    NSString *selectedLanguage = JSGetLanguage();
    
    // assume that only 2 languages, you can add more
    if ([selectedLanguage isEqualToString:@"en"]) {
        cell.textLabel.text = @"English";
    } else {
        cell.textLabel.text = @"中文";
    }
    
    return cell;
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0: { // cancel
            break;
        }
        case 1: { // English
            JSSetLanguage(@"en");
            [self.navigationController popViewControllerAnimated:YES];
            break;
        }
        case 2: { // 中文
            JSSetLanguage(@"zh-Hans");
            [self.navigationController popViewControllerAnimated:YES];
            break;
        }
        default:
            break;
    }
}

@end
