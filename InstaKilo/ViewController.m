//
//  ViewController.m
//  InstaKilo
//
//  Created by Mar Koss on 2017-10-18.
//  Copyright © 2017 Mar Koss. All rights reserved.
//

#import "ViewController.h"
#import "MyCollectionViewCell.h"
#import "MyImageObject.h"
#import "MyHeaderReusableView.h"

@interface ViewController ()
// <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) UICollectionViewFlowLayout *simpleLayout;
@property (strong, nonatomic) UICollectionViewFlowLayout *smallLayout;
@property (nonatomic) NSMutableArray *pictureArray;
@property (nonatomic) MyImageObject *objectOne;
@property (nonatomic) MyImageObject *objectTwo;
@property (nonatomic) MyImageObject *objectThree;
@property (nonatomic) MyImageObject *objectFour;
@property (nonatomic) MyImageObject *objectFive;
@property (nonatomic) MyImageObject *objectSix;
@property (nonatomic) MyImageObject *objectSeven;
@property (nonatomic) MyImageObject *objectEight;
@property (nonatomic) MyImageObject *objectNine;
@property (nonatomic) MyImageObject *objectTen;




@end

@implementation ViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.objectOne = [[MyImageObject alloc] initWithSubject:@"Great" location:@"Murica" andImage:[UIImage imageNamed:@"picture-1"]];
    self.objectTwo = [[MyImageObject alloc] initWithSubject:@"Best" location:@"Your Mother's House" andImage:[UIImage imageNamed:@"picture-2"]];
    self.objectThree = [[MyImageObject alloc] initWithSubject:@"Great" location:@"Murica" andImage:[UIImage imageNamed:@"picture-3"]];
    self.objectFour = [[MyImageObject alloc] initWithSubject:@"Best" location:@"Kekistan" andImage:[UIImage imageNamed:@"picture-4"]];
    self.objectFive = [[MyImageObject alloc] initWithSubject:@"Great" location:@"Murica" andImage:[UIImage imageNamed:@"picture-5"]];
    self.objectSix = [[MyImageObject alloc] initWithSubject:@"Best" location:@"Your Mother's House" andImage:[UIImage imageNamed:@"picture-6"]];
    self.objectSeven = [[MyImageObject alloc] initWithSubject:@"Great" location:@"Murica" andImage:[UIImage imageNamed:@"picture-7"]];
    self.objectEight = [[MyImageObject alloc] initWithSubject:@"Best" location:@"Kekistan" andImage:[UIImage imageNamed:@"picture-8"]];
    self.objectNine = [[MyImageObject alloc] initWithSubject:@"Great" location:@"Murica" andImage:[UIImage imageNamed:@"picture-9"]];
    self.objectTen = [[MyImageObject alloc] initWithSubject:@"Best" location:@"Your Mother's House" andImage:[UIImage imageNamed:@"picture-10"]];


    self.pictureArray = [[NSMutableArray alloc] initWithObjects:self.objectOne,
                         self.objectTwo,
                         self.objectThree,
                         self.objectFour,
                         self.objectFive,
                         self.objectSix,
                         self.objectSeven,
                         self.objectEight,
                         self.objectNine,
                         self.objectTen,
                         nil];
    
//    for (self.pictureArray )
    
    
//    for (int x = 0; x < self.pictureArray.count; x++) {
//        [self.pictureArray addObject:[UIImage imageNamed:[NSString stringWithFormat:@"picture-%d", x+1]]];
//    }

    
    [self setupSimpleLayout];
    [self setupSmallLayout];
    
    self.collectionView.collectionViewLayout = self.smallLayout;
    
    

}


- (void)setupSimpleLayout {
    self.simpleLayout = [[UICollectionViewFlowLayout alloc] init];
    self.simpleLayout.itemSize = CGSizeMake(200, 200);
    self.simpleLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    self.simpleLayout.minimumInteritemSpacing = 15;
    self.simpleLayout.minimumLineSpacing = 10;
    
    self.simpleLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.simpleLayout.headerReferenceSize = CGSizeMake(50, self.collectionView.frame.size.height);
    
    self.simpleLayout.footerReferenceSize = CGSizeMake(30, self.collectionView.frame.size.width);
}

- (void)setupSmallLayout
{
    self.smallLayout = [[UICollectionViewFlowLayout alloc] init];
    self.smallLayout.itemSize = CGSizeMake(130, 130);
    self.smallLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    self.smallLayout.minimumLineSpacing = 5;
    self.smallLayout.minimumInteritemSpacing = 5;
    self.smallLayout.headerReferenceSize = CGSizeMake(CGRectGetWidth(self.collectionView.frame), 25);
    self.smallLayout.footerReferenceSize = CGSizeMake(CGRectGetWidth(self.collectionView.frame), 15);
}


- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    MyCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"imageCell"
                                                                                forIndexPath:indexPath];
    
    MyImageObject *imageObjectProxy = [self.pictureArray objectAtIndex:indexPath.row];
    
    cell.cellImageView.image = imageObjectProxy.image;
    
    
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    NSInteger pictureCount = self.pictureArray.count;
    return pictureCount;
}

//- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView
//     numberOfItemsInSection:(NSInteger)section
//{
//    switch (section) {
//        case 0:
//            return 5;
//        case 1:
//            return 3;
//    }
//}

//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
//           viewForSupplementaryElementOfKind:(NSString *)kind
//                                 atIndexPath:(NSIndexPath *)indexPath
//{
////    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
//        MyHeaderReusableView *headerReusableView = [self.collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
//                                                                           withReuseIdentifier:@"MyHeaderReusableView"
//                                                                                  forIndexPath:indexPath];
//        headerReusableView.headerLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.section];
//        return headerReusableView;
////    }
//    else if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
//        MyFooterView *footerView = [self.collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter
//                                                                           withReuseIdentifier:@"MyFooterView"
//                                                                                  forIndexPath:indexPath];
//        footerView.label.text = [NSString stringWithFormat:@"%ld", (long)indexPath.section];
//        return footerView;
//    }
//    else {
//        return nil;
//    }
//}

@end
