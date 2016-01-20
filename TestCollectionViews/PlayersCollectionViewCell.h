//
//  PlayersCollectionViewCell.h
//  TestCollectionViews
//
//  Created by Anand Kumar 5 on 1/19/16.
//  Copyright © 2016 OutOnAWeekend. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"

@interface PlayersCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *playerNameLabel;
@property (weak, nonatomic) Player *player;

@end
