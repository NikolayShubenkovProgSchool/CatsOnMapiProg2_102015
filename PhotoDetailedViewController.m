//
//  PhotoDetailedViewController.m
//  CatsOnMapiProg2_102015
//
//  Created by Nikolay Shubenkov on 24/10/15.
//  Copyright © 2015 Nikolay Shubenkov. All rights reserved.
//

#import "PhotoDetailedViewController.h"
#import "UIImageView+AFNetworking.h"

@interface PhotoDetailedViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabe;
@property (weak, nonatomic) IBOutlet UILabel *owner;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation PhotoDetailedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.imageView setImageWithURL:self.photoInfo.url placeholderImage:nil];
    self.titleLabe.text = self.photoInfo.title;
    self.date.text = self.photoInfo.date;
    self.owner.text = self.photoInfo.ownerName;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
