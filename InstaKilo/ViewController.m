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
@property (nonatomic) NSMutableArray *subjectArray1;
@property (nonatomic) NSMutableArray *subjectArray2;
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
    self.objectTwo = [[MyImageObject alloc] initWithSubject:@"Great" location:@"Your Mother's House" andImage:[UIImage imageNamed:@"picture-2"]];
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
    
    self.subjectArray1 = [NSMutableArray new];
    self.subjectArray2 = [NSMutableArray new];

    
    
    for (MyImageObject *x in self.pictureArray) {
        if ([x.subject isEqualToString:@"Great"]){
            [self.subjectArray1 addObject:x];
        }
        else {
            [self.subjectArray2 addObject:x];
        }
    }

    
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
    self.smallLayout.headerReferenceSize = CGSizeMake(CGRectGetWidth(self.collectionView.frame), 30);
    self.smallLayout.footerReferenceSize = CGSizeMake(CGRectGetWidth(self.collectionView.frame), 15);
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return self.subjectArray1.count;
        case 1:
            return self.subjectArray2.count;
        default:
            return 1;
    }
}

//data collection
- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    
    if (indexPath.section == 0) {
        MyCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"imageCell"
                                                                                    forIndexPath:indexPath];
        
        MyImageObject *imageObjectProxy = [self.subjectArray1 objectAtIndex:indexPath.row];
        
        cell.cellImageView.image = imageObjectProxy.image;
        
        return cell;
    }
    else if (indexPath.section == 1) {
        MyCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"imageCell"
                                                                                    forIndexPath:indexPath];
        
        MyImageObject *imageObjectProxy = [self.subjectArray2 objectAtIndex:indexPath.row];
        
        cell.cellImageView.image = imageObjectProxy.image;
        
        return cell;
    }
    return nil;
}


// collect header data
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath {

        MyHeaderReusableView *headerReusableView = [self.collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                                           withReuseIdentifier:@"MyHeaderReusableView"
                                                                                  forIndexPath:indexPath];
    if (indexPath.section == 0) {
    
        headerReusableView.headerLabel.text = @"Great";
        return headerReusableView;
    }

    else if (indexPath.section == 1) {
        headerReusableView.headerLabel.text = @"Best";
        return headerReusableView;
    }
    return nil;
}

@end
