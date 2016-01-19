//
//  ViewController.m
//  TestCollectionViews
//
//  Created by Anand Kumar 5 on 1/19/16.
//  Copyright © 2016 OutOnAWeekend. All rights reserved.
//

#import "ViewController.h"
#import "InformationViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)createData {
    
}

- (void)viewDidAppear:(BOOL)animated {
    InformationViewController *vc = [[InformationViewController alloc] initWithNibName:@"InformationViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:NO];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
