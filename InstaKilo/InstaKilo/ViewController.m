//
//  ViewController.m
//  InstaKilo
//
//  Created by Yevhen Kim on 2016-07-13.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "ViewController.h"
#import "PhotosViewCell.h"
#import "HeaderCollectionReusableView.h"
#import "DetailViewController.h"
#import "Image.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (weak, nonatomic) IBOutlet UISegmentedControl *categoryController;

@property (nonatomic) NSArray *images;
@property (nonatomic) NSDictionary *location;
@property (nonatomic) NSDictionary *subject;
@property (nonatomic) NSInteger numberOfSections;

@property (nonatomic) NSArray *locationKeys;
@property (nonatomic) NSArray *subjectKeys;

@property (nonatomic) NSDictionary *currentData;
@property (nonatomic) NSArray *currentKey;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // make 8 image objects
    Image *imageToronto1 = [[Image alloc]initWithImage:@"Adium.png"
                                            andSubject:@"Tech"
                                           andLocation:@"Toronto"];
    
    Image *imageToronto2 = [[Image alloc]initWithImage:@"grunt.png"
                                            andSubject:@"Tech"
                                           andLocation:@"Toronto"];
    
    Image *imageToronto3 = [[Image alloc]initWithImage:@"Rudolph.png"
                                            andSubject:@"Heroes"
                                           andLocation:@"Toronto"];
    
    Image *imageQuebec1  = [[Image alloc]initWithImage:@"Candles.png"
                                           andSubject:@"Other"
                                          andLocation:@"Quebec"];
    
    Image *imageQuebec2  = [[Image alloc]initWithImage:@"luigi.png"
                                           andSubject:@"Heroes"
                                          andLocation:@"Quebec"];
    
    Image *imageQuebec3  = [[Image alloc]initWithImage:@"Mario.png"
                                           andSubject:@"Heroes"
                                          andLocation:@"Quebec"];
    
    Image *imageLondon1  = [[Image alloc]initWithImage:@"sonic.png"
                                           andSubject:@"Heroes"
                                          andLocation:@"London"];
    
    Image *imageLondon2  = [[Image alloc]initWithImage:@"mrx.png"
                                           andSubject:@"Heroes"
                                          andLocation:@"London"];

    
    //save images by location and subject to the dictionaries
    self.location = @{@"Toronto": @[imageToronto1, imageToronto2, imageToronto3],
                      @"Quebec": @[imageQuebec1, imageQuebec2, imageQuebec3],
                      @"London":@[imageLondon1, imageLondon2]};
    
    self.subject = @{@"Tech":@[imageToronto1, imageToronto2],
                     @"Heroes":@[imageToronto3, imageQuebec2, imageQuebec3, imageLondon1, imageLondon2],
                     @"Other":@[imageQuebec1]};


    //save all keys to keys arrays
    self.locationKeys = [self.location allKeys];
    self.subjectKeys = [self.subject allKeys];
    
    //sort arrays

    self.locationKeys = [self.locationKeys sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    self.subjectKeys = [self.subjectKeys sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];

    //default current data
    self.currentKey = self.subjectKeys;
    self.currentData = self.subject;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.currentKey.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSString *key = self.currentKey[section];
    NSArray *items = self.currentData[key];
    return items.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PhotosViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"basicCollectionCell" forIndexPath:indexPath];
    // you need to get the key so that you can get the array value in the dictionary
    NSString *key = self.currentKey[indexPath.section];
    // use the key to get the array of the currently active dictionary
    NSArray *data = self.currentData[key];
    // once you have that get the current item using the array and indexpath.item
    Image *image = data[indexPath.item];
    // this gives you the object
    // you need to unwrap that item and get the image name
    NSString *imageName = image.imageName;
    UIImage *cellImage = [UIImage imageNamed:imageName];
    cell.imageView.image = cellImage;
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        HeaderCollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"reusableHeader" forIndexPath:indexPath];
        // you need to get the section from the indexpath
        // get the currentKey at that section
        // assign it to the custom cell
        NSString *key = self.currentKey[indexPath.section];
        header.sectionTitle.text = key;
        return header;
    }
    return nil;
}


#pragma mark - Segmented Controller

- (IBAction)changeCategory:(UISegmentedControl *)sender {
    
    switch (sender.selectedSegmentIndex) {
        case 0: {
            self.currentKey = self.subjectKeys;
            self.currentData = self.subject;
        }
            
        case 1: {
            self.currentKey = self.locationKeys;
            self.currentData = self.location;
        }

    }
    [self.collectionView reloadData];
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showImageDetails"]) {
        NSIndexPath *selectedPath = [self.collectionView indexPathForCell:sender];
        NSString *key = self.currentKey[selectedPath.section];
        NSArray *images = self.currentData[key];
        Image *image = images[selectedPath.item];
        DetailViewController *details = (DetailViewController *)segue.destinationViewController;
        details.image = image;
    }
}


@end
