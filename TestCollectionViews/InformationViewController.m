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

@end

@implementation InformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [self.teamsCollectionView registerNib:[UINib nibWithNibName:@"TeamsCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"Team Cell"];
    self.teamsCollectionView.dataSource = self;
    self.teamsCollectionView.delegate = self;

//    self.teamsCollectionViewLayout = [UICollectionViewFlowLayout new];
//    self.teamsCollectionViewLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
////    self.teamsCollectionViewLayout.minimumInteritemSpacing = 2.0f;
//    self.teamsCollectionViewLayout.minimumLineSpacing = 5.0f;
//    
//    [self.teamsCollectionView setCollectionViewLayout:self.teamsCollectionViewLayout];

}

- (void)viewDidLayoutSubviews {
    
    self.placeholderViewHeightConstraint.constant = 150*[self collectionView:self.teamsCollectionView numberOfItemsInSection:0];
    self.teamsCollectionViewHeightConstraint.constant = 150*[self collectionView:self.teamsCollectionView numberOfItemsInSection:0];
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
