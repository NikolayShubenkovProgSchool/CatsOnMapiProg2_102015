//
//  FlickrPhotoInfo.m
//  CatsOnMapiProg2_102015
//
//  Created by Nikolay Shubenkov on 24/10/15.
//  Copyright © 2015 Nikolay Shubenkov. All rights reserved.
//

#import "FlickrPhotoInfo.h"

@interface FlickrPhotoInfo()

@property (nonatomic, readwrite, copy, nullable) NSString *title;

@end

@implementation FlickrPhotoInfo

- (CLLocationCoordinate2D)coordinate {
    CLLocationCoordinate2D location;
    
    location.latitude = self.latitude;
    location.longitude = self.longitude;

    return location;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    NSLog(@"%@",dictionary);
    
    self.title = dictionary[@"title"];
    self.url = [NSURL URLWithString:dictionary[@"url_l"]];
    
    self.longitude = [dictionary[@"longitude"] doubleValue];
    self.latitude = [dictionary[@"latitude"] doubleValue];
    self.date = dictionary[@"datetaken"];
    self.ownerName = dictionary[@"ownername"];
    
    NSParameterAssert(self.date != nil);
    
    return self;
}

@end
