//
//  Province.m
//  ZSAddressPicker
//
//  Created by 周顺 on 16/7/27.
//  Copyright © 2016年 AIRWALK. All rights reserved.
//

#import "Province.h"

@implementation Province

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self parse:dict];
    }
    return self;
}

- (void)parse:(NSDictionary *)dict {
    
    if (!dict) return;
    
    self.provinceName = [[dict allKeys] firstObject];
    
    NSDictionary *dict2 = [dict objectForKey:self.provinceName];
    
    NSArray *keyArray = [dict2 allKeys];
    
    NSArray *sortKeyArray = [keyArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        if ([obj1 integerValue] > [obj2 integerValue]) {
            return NSOrderedDescending;
        } else if ([obj1 integerValue] < [obj2 integerValue]) {
            return NSOrderedAscending;
        } else {
            return NSOrderedSame;
        }
    }];
    
    for (NSString *key in sortKeyArray) {
        
        NSDictionary *cityDict = [dict2 objectForKey:key];
        
        City *city = [[City alloc] initWithDict:cityDict];

        [self.cityArray addObject:city];
    }
}

- (NSMutableArray *)cityArray {
    if (!_cityArray) {
        _cityArray = [NSMutableArray array];
    }
    return _cityArray;
}

@end
