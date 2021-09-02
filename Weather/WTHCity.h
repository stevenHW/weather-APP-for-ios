//
//  WTHCity.h
//  Weather
//
//  Created by Steven on 13-12-3.
//  Copyright (c) 2013年 Steven. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WTHCity : NSObject

@property(nonatomic,strong) NSString* cityCode;
@property(nonatomic,strong) NSString* imageName;
@property(nonatomic,strong) NSString* name;
@property(nonatomic,strong) NSString* temp;
@property(nonatomic,strong) NSString* date;
@property(nonatomic,strong) NSString* week;
@property(nonatomic,strong) NSString* weather1;
@property(nonatomic,strong) NSString* index_d;

-(instancetype) initWithWeather:(NSDictionary*)weather;
-(void)updateWeather:(NSDictionary*) weather;


@end
