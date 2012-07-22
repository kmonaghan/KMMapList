//
//  KMViewController.m
//  KMMapKit
//
//  Created by Karl Monaghan on 22/07/2012.
//  Copyright (c) 2012 None. All rights reserved.
//

#import "KMViewController.h"
#import "KMItem.h"
#import "KMItemView.h"
#import "KMItemAnnotation.h"

@interface KMViewController ()
{
    NSArray         *_items;
    NSMutableArray  *_mapAnnotations;
    NSInteger       _currentPage;
}

@property (strong, nonatomic) NSArray *items;
@property (strong, nonatomic) NSMutableArray *mapAnnotations;
@property (weak, nonatomic) IBOutlet MKMapView *listMapView;
@property (weak, nonatomic) IBOutlet UIScrollView *listScrollView;
@end

@implementation KMViewController
@synthesize items = _items;
@synthesize mapAnnotations = _mapAnnotations;
@synthesize listMapView;
@synthesize listScrollView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        NSDictionary *bar1 = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"53.343895", @"-6.263518", @"Stag's Head", @"Dame Lane, Dublin, Co. Dublin", nil] 
                                                         forKeys:[NSArray arrayWithObjects:@"lat", @"lng",@"title", @"description", nil]];
        NSDictionary *bar2 = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"53.344440", @"-6.263521", @"Foggy Dew", @"Upper Fownes Street, Dublin, Co. Dublin", nil] 
                                                         forKeys:[NSArray arrayWithObjects:@"lat", @"lng", @"title", @"description", nil]];
        NSDictionary *bar3 = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"53.341972", @"-6.264589", @"Hogans", @"Fade Street, Dublin, Co. Dublin", nil] 
                                                         forKeys:[NSArray arrayWithObjects:@"lat", @"lng", @"title", @"description", nil]];
        self.items = [NSArray arrayWithObjects:bar1, bar2, bar3, nil];
        _currentPage = 0;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.listScrollView.delegate = self;
    
    self.listMapView.delegate = self;
    
    int count = 0;
    
    self.mapAnnotations = [[NSMutableArray alloc] initWithCapacity:[_items count]];
    
    for (NSDictionary *item in _items) 
    {
        KMItemView *view = [KMItemView viewFromNibWithFrame:CGRectMake((320 * count), 0, 320, 60)];
        
        view.itemTitle.text = [item objectForKey:@"title"];
        view.itemDescription.text = [item objectForKey:@"description"];
        
        [self.listScrollView addSubview:view];
        
        count++;
        KMItemAnnotation *annotation =[[KMItemAnnotation alloc] init];
        annotation.item = [[KMItem alloc] initWithDictionary:item];             
        [self.mapAnnotations addObject:annotation];
    }
    
    [self.listScrollView setContentSize:CGSizeMake(320 * count, 60)];
    
    MKCoordinateRegion newRegion;
    newRegion.center.latitude = 53.343895;
    newRegion.center.longitude = -6.263518;
    newRegion.span.latitudeDelta = 0.002872;
    newRegion.span.longitudeDelta = 0.000863;
    
    [self.listMapView setRegion:newRegion animated:YES];
    
    [self.listMapView addAnnotations:self.mapAnnotations];
}

- (void)viewDidUnload
{
    [self setListMapView:nil];
    [self setListScrollView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma UIScrollViewDelegate method
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    float fractionalPage = scrollView.contentOffset.x / scrollView.frame.size.width;
    NSInteger page = lround(fractionalPage);
    
    if (_currentPage != page) 
    {
        _currentPage = page;
        
        [self.listMapView selectAnnotation:[self.mapAnnotations objectAtIndex:_currentPage] animated:YES];
    }
    
    NSLog(@"%d", _currentPage);
}

#pragma MKMapViewDelegate method
- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    KMItemAnnotation *annotation = (KMItemAnnotation *)view.annotation;
    
    int count = 0;
    int index = _currentPage;
    
    for (NSDictionary *item in _items) 
    {
        if ([[item objectForKey:@"title"] isEqualToString:annotation.item.title])
        {
            index = count;
            
            break;
        }
        
        count++;
    }
    
    if (index != _currentPage)
    {
        [self.listScrollView setContentOffset:CGPointMake(320 * index, 0) animated:YES];
        _currentPage = index;
    }
}
@end
