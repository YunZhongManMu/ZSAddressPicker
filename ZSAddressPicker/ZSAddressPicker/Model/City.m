//
//  City.m
//  ZSAddressPicker
//
//  Created by 周顺 on 16/7/27.
//  Copyright © 2016年 AIRWALK. All rights reserved.
//

#import "City.h"

@implementation City

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self parse:dict];
    }
    return self;
}

- (void)parse:(NSDictionary *)dict {
    
    if (!dict) return;
    
    self.cityName = [[dict allKeys] firstObject];
    
    self.countryArray = [NSMutableArray arrayWithArray:[dict objectForKey:self.cityName]];
}

-(NSMutableArray *)countryArray {
    if (!_countryArray) {
        _countryArray = [NSMutableArray array];
    }
    return _countryArray;
}

@end
