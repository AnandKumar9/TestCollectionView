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
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *teamsCollectionViewTrailingSpaceConstraint;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

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
    
    [self.teamsCollectionView setCollectionViewLayout:self.teamsCollectionViewLayout];
}

- (void)viewWillLayoutSubviews {
    
    TeamsCollectionViewCell *teamCollectionViewCell = (TeamsCollectionViewCell *)[[[NSBundle mainBundle] loadNibNamed:@"TeamsCollectionViewCell" owner:self options:nil] objectAtIndex:0];
    teamCollectionViewCell.frame = CGRectMake(0, 0, CGRectGetWidth(self.teamsCollectionView.bounds), CGRectGetHeight(teamCollectionViewCell.frame));
    [teamCollectionViewCell setNeedsLayout];
    [teamCollectionViewCell layoutIfNeeded];
    
    CGFloat height = [teamCollectionViewCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    self.teamsCollectionViewLayout.estimatedItemSize = CGSizeMake(CGRectGetWidth(self.teamsCollectionView.bounds), height);
    
    
    self.teamsCollectionViewHeightConstraint.constant = self.teamsCollectionView.collectionViewLayout.collectionViewContentSize.height;
    [self.view setNeedsLayout];
}

//- (void)viewDidLayoutSubviews {
//    self.teamsCollectionViewHeightConstraint.constant = self.teamsCollectionView.collectionViewLayout.collectionViewContentSize.height;
//    [self.view setNeedsLayout];
//}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
//    [self.teamsCollectionView reloadData];
//    self.scrollView.contentSize = CGSizeMake(320.0, 1800.0);
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.appDelegate.teams.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.item == 10) {
        
    }
    TeamsCollectionViewCell *cell = (TeamsCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"Team Cell" forIndexPath:indexPath];
    cell.team = self.appDelegate.teams[indexPath.item];
    cell.appPlayerViewLabel.text = [NSString stringWithFormat:@"Team Cell - %ld", (long)indexPath.item];
    if (indexPath.item == 9) {
        
    }

    return cell;

}

@end
