//
//  ViewController.m
//  Retest
//
//  Created by Yevhen Kim on 2016-07-18.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "MasterViewController.h"
#import "Actress.h"
#import "ActressCell.h"
#import "ActressDetailController.h"

@interface MasterViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic) NSArray *actresses;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Actress *actress1 = [[Actress alloc]initWithImageName:@"aishwarya_rai.png"
                                           andActressName:@"Aishwarya Rai"];
    
    Actress *actress2 = [[Actress alloc]initWithImageName:@"asin_thottumkal.png"
                                           andActressName:@"Asin Thottumkal"];
    
    Actress *actress3 = [[Actress alloc]initWithImageName:@"deepika_padukones.png"
                                           andActressName:@"Deepika Padukones"];
    
    self.actresses = [[NSArray alloc]initWithObjects:actress1, actress2, actress3, nil];
    
    [self.collectionView reloadData];
}

#pragma mark - UICollectionViewDataSource


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.actresses.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ActressCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"basicCellCollection" forIndexPath:indexPath];
    Actress *actress = self.actresses[indexPath.row];
    
    cell.actressImage.image = [UIImage imageNamed:actress.imageName];
    
    return cell;

}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showActressDetails"]) {
        NSIndexPath *selectedPath = [self.collectionView indexPathForCell:sender];
        Actress *actress = self.actresses[selectedPath.item];
        ActressDetailController *details = (ActressDetailController *)[segue destinationViewController];
        details.actress = actress;
    }
}

@end
