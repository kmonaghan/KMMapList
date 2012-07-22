//
//  KMItemAnnotation.h
//  KMMapKit
//
//  Created by Karl Monaghan on 22/07/2012.
//  Copyright (c) 2012 None. All rights reserved.
//

#import <MapKit/MapKit.h>

@class KMItem;

@interface KMItemAnnotation : NSObject
{
    KMItem *_item;
}

@property(nonatomic, retain) KMItem *item;

@end
