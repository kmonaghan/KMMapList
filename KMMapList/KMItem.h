//
//  KMItem.h
//  KMMapKit
//
//  Created by Karl Monaghan on 22/07/2012.
//  Copyright (c) 2012 None. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KMItem : NSObject
{
    float _lat;
    float _lng;
    
    NSString *_title;
    NSString *_description;
}

@property(nonatomic) float lat;
@property(nonatomic) float lng;
@property(nonatomic, retain) NSString *title;
@property(nonatomic, retain) NSString *description;

- (id)initWithDictionary:(NSDictionary *)details;
@end
