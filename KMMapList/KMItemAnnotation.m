//
//  KMItemAnnotation.m
//  KMMapKit
//
//  Created by Karl Monaghan on 22/07/2012.
//  Copyright (c) 2012 None. All rights reserved.
//

#import "KMItemAnnotation.h"
#import "KMItem.h"

@implementation KMItemAnnotation

@synthesize item = _item;

- (CLLocationCoordinate2D)coordinate;
{
    CLLocationCoordinate2D theCoordinate;
    theCoordinate.latitude = _item.lat;
    theCoordinate.longitude = _item.lng;
    return theCoordinate; 
}

- (NSString *)title
{
    return _item.title;
}

// optional
- (NSString *)subtitle
{
    return _item.description;
}
@end
