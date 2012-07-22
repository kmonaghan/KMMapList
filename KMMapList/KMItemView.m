//
//  KMItemView.m
//  KMMapList
//
//  Created by Karl Monaghan on 21/07/2012.
//  Copyright (c) 2012 None. All rights reserved.
//

#import "KMItemView.h"

@implementation KMItemView
@synthesize itemImage;
@synthesize itemTitle;
@synthesize itemDescription;

+ (KMItemView *)viewFromNibWithFrame:(CGRect)frame
{

    KMItemView *customView = nil; 
    NSArray* elements = [[NSBundle mainBundle] loadNibNamed:@"KMItemView" 
                                                      owner:nil 
                                                    options:nil]; 
    
    for (id anObject in elements) 
    { 
        if ([anObject isKindOfClass:[KMItemView class]]) 
        { 
            customView = anObject;
            break; 
        } 
    } 
    
    customView.frame = frame;
    
    return customView;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
