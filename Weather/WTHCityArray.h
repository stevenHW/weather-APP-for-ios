//
//  WTHCityArray.h
//  Weather
//
//  Created by Steven on 13-12-3.
//  Copyright (c) 2013年 Steven. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WTHCity.h"
@interface WTHCityArray : NSObject

-(NSInteger)count;
-(WTHCity*) objectAtIndexedSubscript:(NSUInteger)idx;
-(void) addCity:(NSDictionary*) city;
-(void)removeObjectAtIndex:(NSUInteger)index;
-(void) refreshAll;
@end
