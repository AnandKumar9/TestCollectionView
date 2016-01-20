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
    self.teamsCollectionViewLayout.minimumLineSpacing = 9.0f;
    
    [self.teamsCollectionView setCollectionViewLayout:self.teamsCollectionViewLayout];
}

- (void)viewWillLayoutSubviews {
    
    TeamsCollectionViewCell *teamCollectionViewCell = (TeamsCollectionViewCell *)[[[NSBundle mainBundle] loadNibNamed:@"TeamsCollectionViewCell" owner:self options:nil] objectAtIndex:0];
//    teamCollectionViewCell.frame = CGRectMake(0, 0, CGRectGetWidth(self.teamsCollectionView.bounds), CGRectGetHeight(teamCollectionViewCell.frame));
    teamCollectionViewCell.frame = CGRectMake(0, 0, CGRectGetWidth(self.teamsCollectionView.frame), CGRectGetHeight(teamCollectionViewCell.frame));
    [teamCollectionViewCell setNeedsLayout];
    [teamCollectionViewCell layoutIfNeeded];
    
    CGFloat height = [teamCollectionViewCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    self.teamsCollectionViewLayout.estimatedItemSize = CGSizeMake(CGRectGetWidth(self.teamsCollectionView.bounds), height);

    
//    let cell = StandaloneCell.createFromNib()//just loads the nib from the bundle
//    configureCell(cell)
//    cell.frame = CGRectMake(0, 0, CGRectGetWidth(collectionView.bounds), CGRectGetHeight(cell.frame))
//    cell.setNeedsLayout()
//    cell.layoutIfNeeded()
//    let desiredHeight: CGFloat = cell.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height
//    return CGSize(width: CGRectGetWidth(collectionView.bounds),height: desiredHeight)

}

- (void)viewDidLayoutSubviews {
//    
//    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
//    CGFloat cellDimension = (screenWidth - 2*self.teamsCollectionViewTrailingSpaceConstraint.constant);
////    CGSize cellSize = CGSizeMake(cellDimension, 150);
//    CGSize cellSize = CGSizeMake(self.teamsCollectionView.frame.size.width - 2*self.teamsCollectionViewTrailingSpaceConstraint.constant, 200);
////    [self.teamsCollectionViewLayout setItemSize:cellSize];
    
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
