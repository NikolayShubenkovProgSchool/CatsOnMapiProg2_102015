//
//  MapViewController.m
//  CatsOnMapiProg2_102015
//
//  Created by Nikolay Shubenkov on 24/10/15.
//  Copyright © 2015 Nikolay Shubenkov. All rights reserved.
//

#import "MapViewController.h"
#import "AFNetworking.h"
@import MapKit;

#import "FlickrPhotoInfo.h"

#import "PhotoDetailedViewController.h"

@interface MapViewController () <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) NSArray *photosInfoes;
@end

@implementation MapViewController

- (IBAction)findCats:(id)sender {
    NSMutableDictionary *parameters = [NSMutableDictionary new];
    parameters[@"tags"] = @"cats";
    parameters[@"bbox"] = @"bbox";
    parameters[@"lat"]  = @35;
    parameters[@"lon"]  = @55;
    parameters[@"radius"] = @10;
    parameters[@"extras"] = @"url_l,geo,date_taken,owner_name";
    parameters[@"format"] = @"json";
    
    
    parameters[@"content_type"] = @1;
    parameters[@"nojsoncallback"] = @1;
    
    parameters[@"method"] = @"flickr.photos.search";
    
    parameters[@"api_key"] = @"2b2c9f8abc28afe8d7749aee246d951c";
    

    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]initWithBaseURL:[NSURL URLWithString:@"https://api.flickr.com/services/rest/"]];
    manager.responseSerializer = [AFJSONResponseSerializer new];
    AFHTTPRequestOperation *op = [manager GET:@""
                                   parameters:parameters
                                      success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
                                          NSLog(@"recieved data: %@",responseObject);
                                          [self parsePhotos:responseObject];
                                          [self updateMapView];
                                      }
                                      failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
                                          NSLog(@"error: %@",error);
                                      }];
}

- (void)parsePhotos:(id)photosInfo {
    NSDictionary *photos = [photosInfo valueForKey:@"photos"];
    NSArray *photoArray = photos[@"photo"];
    
    NSMutableArray *data = [NSMutableArray new];
    for (NSDictionary *info in photoArray){
        
        FlickrPhotoInfo *flickrData = [[FlickrPhotoInfo alloc]initWithDictionary:info];
        [data addObject:flickrData];
    }
    self.photosInfoes = data;
}

- (void)updateMapView {
    self.mapView.delegate = self;
    [self.mapView removeAnnotations:self.mapView.annotations];
    [self.mapView addAnnotations:self.photosInfoes];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    NSString *identifier = @"mapID";
    MKAnnotationView *view = [mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (view == nil){
        view = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        view.enabled = YES;
        view.canShowCallout = YES;
        
        UIButton *button=  [UIButton buttonWithType:UIButtonTypeInfoLight];
        button.frame = CGRectMake(0, 0, 40, 30);
        view.leftCalloutAccessoryView = button;
        
    }
    return view;
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view NS_AVAILABLE(10_9, 4_0) {
    FlickrPhotoInfo *info = view.annotation;
    [self performSegueWithIdentifier:@"Show Flickr Photo" sender:info];
    NSLog(@"select");
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[PhotoDetailedViewController class] ]){
        PhotoDetailedViewController *vc = segue.destinationViewController;
        vc.photoInfo = sender;
    }
}


@end
