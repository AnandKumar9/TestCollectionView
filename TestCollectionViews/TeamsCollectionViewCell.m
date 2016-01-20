//
//  TeamsCollectionViewCell.m
//  TestCollectionViews
//
//  Created by Anand Kumar 5 on 1/19/16.
//  Copyright © 2016 OutOnAWeekend. All rights reserved.
//

#import "TeamsCollectionViewCell.h"
#import "AppDelegate.h"
#import "PlayersCollectionViewCell.h"

@interface TeamsCollectionViewCell () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *playersCollectionView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *playersCollectionViewHeightConstraint;
@property (nonatomic) AppDelegate *appDelegate;

@property (nonatomic) UICollectionViewFlowLayout *playersCollectionViewLayout;

@end

@implementation TeamsCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    self.appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [self.playersCollectionView registerNib:[UINib nibWithNibName:@"PlayersCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"Player Cell"];
    
    self.playersCollectionView.dataSource = self;
    self.playersCollectionView.delegate = self;
    
    self.playersCollectionViewLayout = [UICollectionViewFlowLayout new];
    self.playersCollectionViewLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.playersCollectionViewLayout.minimumInteritemSpacing = 0.0f;
    self.playersCollectionViewLayout.minimumLineSpacing = 0.0f;
    
    [self.playersCollectionView setCollectionViewLayout:self.playersCollectionViewLayout];
    
    PlayersCollectionViewCell *playersCollectionViewCell = (PlayersCollectionViewCell *)[[[NSBundle mainBundle] loadNibNamed:@"PlayersCollectionViewCell" owner:self options:nil] objectAtIndex:0];
    playersCollectionViewCell.frame = CGRectMake(0, 0, CGRectGetWidth(self.playersCollectionView.bounds), CGRectGetHeight(playersCollectionViewCell.frame));
    [playersCollectionViewCell setNeedsLayout];
    [playersCollectionViewCell layoutIfNeeded];
    
    CGFloat height = [playersCollectionViewCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    self.playersCollectionViewLayout.estimatedItemSize = CGSizeMake(CGRectGetWidth(self.playersCollectionView.bounds), height);

}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.playersCollectionViewHeightConstraint.constant = self.playersCollectionView.collectionViewLayout.collectionViewContentSize.height;
}

- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    
    UICollectionViewLayoutAttributes *cellLayoutAttributes = [layoutAttributes copy];
    CGRect cellFrame = cellLayoutAttributes.frame;
    self.frame = cellFrame;
    
    [self setNeedsLayout];
    
    cellFrame.size.height = [self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    cellFrame.size.width = [[UIScreen mainScreen] bounds].size.width;

    cellLayoutAttributes.frame = cellFrame;
    
    return cellLayoutAttributes;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.team.players.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    PlayersCollectionViewCell *cell = (PlayersCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"Player Cell" forIndexPath:indexPath];
//    cell.playerNameLabel.text = [self.team.players[indexPath.item] valueForKey:@"name"];
    cell.player =  [self.team.players[indexPath.item] valueForKey:@"name"];
    cell.playerNameLabel.text = [self.team.players[indexPath.item] valueForKey:@"name"];

    return cell;
    
}

@end
