//
//  TeamsCollectionViewCell.m
//  TestCollectionViews
//
//  Created by Anand Kumar 5 on 1/19/16.
//  Copyright © 2016 OutOnAWeekend. All rights reserved.
//

#import "TeamsCollectionViewCell.h"

@implementation TeamsCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    
    UICollectionViewLayoutAttributes *cellLayoutAttributes = [layoutAttributes copy];
    CGRect cellFrame = cellLayoutAttributes.frame;
    self.frame = cellFrame;
    
    [self setNeedsLayout];
    
    cellFrame.size.height = [self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    cellFrame.size.width = [[UIScreen mainScreen] bounds].size.width;
//    cellLayoutAttributes.size = [self systemLayoutSizeFittingSize:layoutAttributes.size withHorizontalFittingPriority:UILayoutPriorityRequired verticalFittingPriority:UILayoutPriorityFittingSizeLevel];

    cellLayoutAttributes.frame = cellFrame;
    
    return cellLayoutAttributes;
    
//    UICollectionViewLayoutAttributes *attr = [layoutAttributes copy];
//    CGSize size = [self.textView sizeThatFits:CGSizeMake(CGRectGetWidth(layoutAttributes.frame),CGFLOAT_MAX)];
//    CGRect newFrame = attr.frame;
//    newFrame.size.height = size.height;
//    attr.frame = newFrame;
//    return attr;
    
}

@end
