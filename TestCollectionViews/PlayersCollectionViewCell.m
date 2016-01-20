//
//  PlayersCollectionViewCell.m
//  TestCollectionViews
//
//  Created by Anand Kumar 5 on 1/19/16.
//  Copyright © 2016 OutOnAWeekend. All rights reserved.
//

#import "PlayersCollectionViewCell.h"

@implementation PlayersCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)layoutSubviews {
    [super layoutSubviews];
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

@end
