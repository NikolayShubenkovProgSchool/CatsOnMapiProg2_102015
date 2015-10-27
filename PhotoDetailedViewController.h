//
//  PhotoDetailedViewController.h
//  CatsOnMapiProg2_102015
//
//  Created by Nikolay Shubenkov on 24/10/15.
//  Copyright © 2015 Nikolay Shubenkov. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FlickrPhotoInfo.h"
@interface PhotoDetailedViewController : UIViewController
@property (nonatomic, strong) FlickrPhotoInfo *photoInfo;
@end
