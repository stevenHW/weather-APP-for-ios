//
//  WTHDetailViewController.m
//  Weather
//
//  Created by Steven on 13-12-3.
//  Copyright (c) 2013年 Steven. All rights reserved.
//

#import "WTHDetailViewController.h"
#import "WTHCity.h"
@interface WTHDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *tempLabel;
@property (weak, nonatomic) IBOutlet UILabel *weekLabel;
@property (weak, nonatomic) IBOutlet UILabel *weather1Label;
@property (weak, nonatomic) IBOutlet UILabel *cityName;
@property (weak, nonatomic) IBOutlet UILabel *index_d;
- (void)configureView;
@end

@implementation WTHDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    UIImageView* imageview=(UIImageView*)[self.view viewWithTag:11];
    self.cityName.text=_city.name;
    self.tempLabel.text=_city.temp;
    self.dateLabel.text=_city.date;
    self.weekLabel.text=_city.week;
    self.weather1Label.text=_city.weather1;
    self.index_d.text=_city.index_d;
    imageview.image=[UIImage imageNamed:_city.imageName];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
