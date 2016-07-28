//
//  China.m
//  ZSAddressPicker
//
//  Created by 周顺 on 16/7/27.
//  Copyright © 2016年 AIRWALK. All rights reserved.
//

#import "China.h"

@implementation China

- (Province *)findProvinceByName:(NSString *)name {
    for (Province *province in self.provinceArray) {
        if ([province.provinceName isEqualToString:name]) {
            return province;
        }
    }
    return nil;
}

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self parse:dict];
    }
    return self;
}

- (void)parse:(NSDictionary *)dict {
    if (!dict) return;
    
    NSArray *keyArray = [dict allKeys];
    
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
        
        NSDictionary *provinceDict = [dict objectForKey:key];
        
        Province *province = [[Province alloc] initWithDict:provinceDict];
        
        [self.provinceArray addObject:province];
    }
}

- (NSMutableArray *)provinceArray {
    if (!_provinceArray) {
        _provinceArray = [NSMutableArray array];
    }
    return _provinceArray;
}

@end
