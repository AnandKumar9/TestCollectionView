//
//  Team.h
//  TestCollectionViews
//
//  Created by Anand Kumar 5 on 1/19/16.
//  Copyright © 2016 OutOnAWeekend. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface Team : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSMutableArray *players;

@end
