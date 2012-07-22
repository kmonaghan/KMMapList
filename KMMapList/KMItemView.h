//
//  KMItemView.h
//  KMMapList
//
//  Created by Karl Monaghan on 21/07/2012.
//  Copyright (c) 2012 None. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KMItemView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *itemImage;
@property (weak, nonatomic) IBOutlet UILabel *itemTitle;
@property (weak, nonatomic) IBOutlet UILabel *itemDescription;

+ (KMItemView *)viewFromNibWithFrame:(CGRect)frame;

@end
