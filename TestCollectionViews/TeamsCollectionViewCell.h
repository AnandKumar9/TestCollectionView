//
//  TeamsCollectionViewCell.h
//  TestCollectionViews
//
//  Created by Anand Kumar 5 on 1/19/16.
//  Copyright © 2016 OutOnAWeekend. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Team.h"

@interface TeamsCollectionViewCell : UICollectionViewCell

@property (nonatomic) Team *team;
@property (weak, nonatomic) IBOutlet UILabel *appPlayerViewLabel;

@end
