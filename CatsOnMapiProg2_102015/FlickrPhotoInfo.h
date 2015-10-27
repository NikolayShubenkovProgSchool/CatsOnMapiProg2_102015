//
//  FlickrPhotoInfo.h
//  CatsOnMapiProg2_102015
//
//  Created by Nikolay Shubenkov on 24/10/15.
//  Copyright © 2015 Nikolay Shubenkov. All rights reserved.
//

#import <Foundation/Foundation.h>
@import MapKit;

@interface FlickrPhotoInfo : NSObject <MKAnnotation>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

@property (nonatomic, readonly, copy, nullable) NSString *title;
@property (nonatomic, strong) NSURL *url;
@property (nonatomic) double longitude;
@property (nonatomic) double latitude;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *ownerName;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
