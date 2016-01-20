//
//  InformationViewController.m
//  TestCollectionViews
//
//  Created by Anand Kumar 5 on 1/19/16.
//  Copyright © 2016 OutOnAWeekend. All rights reserved.
//

#import "InformationViewController.h"
#import "TeamsCollectionViewCell.h"
#import "AppDelegate.h"

@interface InformationViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *teamsCollectionView;
@property (nonatomic) UICollectionViewFlowLayout *teamsCollectionViewLayout;

@property (nonatomic) AppDelegate *appDelegate;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *teamsCollectionViewHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *placeholderViewHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *teamsCollectionViewTrailingSpaceConstraint;

@end

@implementation InformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [self.teamsCollectionView registerNib:[UINib nibWithNibName:@"TeamsCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"Team Cell"];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
    self.teamsCollectionView.dataSource = self;
    self.teamsCollectionView.delegate = self;
    
    self.teamsCollectionViewLayout = [UICollectionViewFlowLayout new];
    self.teamsCollectionViewLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.teamsCollectionViewLayout.minimumInteritemSpacing = 0.0f;
    self.teamsCollectionViewLayout.minimumLineSpacing = 0.0f;
    
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    //    CGFloat cellDimension = (screenWidth - 2*self.photosCollectionViewTrailingSpaceConstraint.constant - 3*self.photosCollectionViewFlowLayout.minimumInteritemSpacing)/4 - 0.1;
////    CGSize cellSize = CGSizeMake(screenWidth - 2*self.teamsCollectionViewTrailingSpaceConstraint.constant - 0.1, 150);
//    CGSize cellSize = CGSizeMake(self.teamsCollectionView.frame.size.width, 150);
//    //    [self.teamsCollectionViewLayout setEstimatedItemSize:cellSize];
//    [self.teamsCollectionViewLayout setItemSize:cellSize];
    
    [self.teamsCollectionView setCollectionViewLayout:self.teamsCollectionViewLayout];
}

- (void)viewDidLayoutSubviews {
    
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    CGFloat cellDimension = (screenWidth - 2*self.teamsCollectionViewTrailingSpaceConstraint.constant);
//    CGSize cellSize = CGSizeMake(cellDimension, 150);
    CGSize cellSize = CGSizeMake(self.teamsCollectionView.frame.size.width - 2*self.teamsCollectionViewTrailingSpaceConstraint.constant, 150);
    [self.teamsCollectionViewLayout setItemSize:cellSize];
    
//    self.placeholderViewHeightConstraint.constant = 150*[self collectionView:self.teamsCollectionView numberOfItemsInSection:0];
//    self.teamsCollectionViewHeightConstraint.constant = 150*[self collectionView:self.teamsCollectionView numberOfItemsInSection:0];
    self.teamsCollectionViewHeightConstraint.constant = self.teamsCollectionView.collectionViewLayout.collectionViewContentSize.height;
    [self.view setNeedsLayout];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.appDelegate.teams.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    TeamsCollectionViewCell *cell = (TeamsCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"Team Cell" forIndexPath:indexPath];

    return cell;

}
@end
