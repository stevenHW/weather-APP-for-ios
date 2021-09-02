//
//  WTHCityArray.m
//  Weather
//
//  Created by Steven on 13-12-3.
//  Copyright (c) 2013年 Steven. All rights reserved.
//

#import "WTHCityArray.h"
#import "WTHCity.h"

@implementation WTHCityArray

{
    NSMutableArray* _cityArray;
}

-(id)init
{
    if (self=[super init])
    {
        _cityArray =[NSMutableArray array];
       // [self loadInitialData];
    }
    return self;
    
}
//main thread
- (NSInteger)count
{
    return [_cityArray count];
    
}
//main thread
-(WTHCity*) objectAtIndexedSubscript:(NSUInteger)idx
{
    return (WTHCity*)_cityArray[idx];
    
}
//worker thread
-(void)addWeather:(NSDictionary *)weather
{
    dispatch_async(dispatch_get_main_queue(), ^
                   {
                       WTHCity*city=[[WTHCity alloc] initWithWeather:weather];
                       [_cityArray addObject:city];
                       NSUInteger index=[_cityArray count]-1;
                       
                       [[NSNotificationCenter defaultCenter] postNotificationName:@"ValueChanged"
                                                                           object:self userInfo:@{
                                                                                                  @"keyType":@"INSERTION",@"keyIndexes":@[@(index)]
                                                                                                  }                                     ];
                   });
}

-(void)loadInitialData
{
//    WTHCity* Beijing=[[WTHCity alloc] init];
//    Beijing.imageName=@"b11";
//    Beijing.name=@"BEIJING";
//    Beijing.temp=@"19°C-13°C";
//    [_cityArray addObject:Beijing];
//    
//    WTHCity* shanghai=[[WTHCity alloc] init];
//    shanghai.imageName=@"b15";
//    shanghai.name=@"SHANGHAI";
//    shanghai.temp=@"1°C-18°C";
//    [_cityArray addObject:shanghai];
//    
//    WTHCity* Tokyo=[[WTHCity alloc] init];
//    Tokyo.imageName=@"b31";
//    Tokyo.name=@"TOKYO";
//    Tokyo.temp=@"11°C-15°C";
//    [_cityArray addObject:Tokyo];

//    [self retrieveWeather:@"101010100" completionHandler:^(NSDictionary *weather) {
//        [self addWeather:weather];
//    }];
//    [self retrieveWeather:@"101050101" completionHandler:^(NSDictionary *weather) {
//        [self addWeather:weather];
//    }];
    
    
}

-(void) refreshAll
{
    for (WTHCity* city in _cityArray)
    {
        [self retrieveWeather:city.cityCode     completionHandler:^(NSDictionary* weather)
         {
             dispatch_async(dispatch_get_main_queue(), ^
                            {
                                NSUInteger index=[_cityArray indexOfObject:city];
                                [city updateWeather:weather];
                                [[NSNotificationCenter defaultCenter] postNotificationName:@"ValueChanged" object:self userInfo:@{@"keyType":@"UPDATE",@"keyIndexes":@[@(index)]       }];
                            });
                            
         }];
    }
}

-(void)retrieveWeather:(NSString *)cityCode completionHandler:(void(^)(NSDictionary* weather))completionHandler
{
    NSURLSession *session=[NSURLSession sharedSession];
    
    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"http://m.weather.com.cn/data/%@.html",cityCode]];
    NSURLSessionDataTask *task=[session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error==nil)
        {
            NSDictionary *weather=[self parseJSON:data];
            if (weather!=nil) {
                completionHandler(weather);
                
            }
            
            else
            {
                NSLog(@"");
            }
        }
    }];
    [task resume];
    
}

-(void)removeObjectAtIndex:(NSUInteger)index
{
    [_cityArray removeObjectAtIndex:index];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ValueChanged" object:self userInfo:@{@"keyType":@"DELETION",@"keyIndexes":@[@(index)]       }];
}

-(void) addCity:(NSDictionary*) city
{
    [self retrieveWeather:city[@"CityCode"] completionHandler:^(NSDictionary *weather) {
        [self addWeather:weather];
    }];
   // [_cityArray addObject:city];
}
                        
- (NSDictionary*)parseJSON:(NSData*) data
{
    NSError* error=nil;
    NSDictionary* infoDic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if (error==nil) {
        return infoDic[@"weatherinfo"];
    }
    else
    {
        return nil;
    }
}
@end
