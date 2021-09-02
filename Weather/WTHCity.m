//
//  WTHCity.m
//  Weather
//
//  Created by Steven on 13-12-3.
//  Copyright (c) 2013年 Steven. All rights reserved.
//

#import "WTHCity.h"

@implementation WTHCity

-(instancetype) initWithWeather:(NSDictionary*)weather
{
    if (self=[super init]) {
        self.name=weather[@"city"];
        self.temp=weather[@"temp1"];
        NSNumber * imageIndex=weather[@"img1"];
        self.imageName=[NSString stringWithFormat:@"b%d",[imageIndex integerValue]];
        self.cityCode=weather[@"cityid"];
        self.date=weather[@"date_y"];
        self.week=weather[@"week"];
        self.weather1=weather[@"weather1"];
        self.index_d=weather[@"index_d"];
        
    }
    return  self;
    
}
-(void)updateWeather:(NSDictionary*) weather
{
    self.name=weather[@"city"];
    self.temp=weather[@"temp1"];
    NSNumber * imageIndex=weather[@"img1"];
    self.imageName=[NSString stringWithFormat:@"b%d",[imageIndex integerValue]];
    self.cityCode=weather[@"cityid"];
    self.date=weather[@"date_y"];
    self.week=weather[@"week"];
    self.weather1=weather[@"weather1"];
    self.index_d=weather[@"index_d"];
}
@end
