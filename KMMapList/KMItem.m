//
//  KMItem.m
//  KMMapKit
//
//  Created by Karl Monaghan on 22/07/2012.
//  Copyright (c) 2012 None. All rights reserved.
//

#import "KMItem.h"

@implementation KMItem
@synthesize lat = _lat;
@synthesize lng = _lng;
@synthesize title = _title;
@synthesize description = _description;

- (id)initWithDictionary:(NSDictionary *)details
{
    self = [super init];
    
    if (self)
    {
        self.lat            = [[details objectForKey:@"lat"] floatValue];
        self.lng            = [[details objectForKey:@"lng"] floatValue];
        self.title          = [details objectForKey:@"title"];
        self.description    = [details objectForKey:@"description"];
    }
    return self;
}
@end
