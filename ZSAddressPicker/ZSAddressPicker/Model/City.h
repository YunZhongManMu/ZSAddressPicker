//
//  City.h
//  ZSAddressPicker
//
//  Created by 周顺 on 16/7/27.
//  Copyright © 2016年 AIRWALK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface City : NSObject

/** 城市名称 */
@property (nonatomic, copy) NSString *cityName;

/** 县区集合 */
@property (nonatomic, strong) NSMutableArray *countryArray;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end
