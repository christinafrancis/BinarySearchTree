//
//  CFViewController.m
//  BinarySearchTree
//
//  Created by Christina Francis on 12/15/13.
//  Copyright (c) 2013 Christina Francis. All rights reserved.
//

#import "CFViewController.h"
#import "BSTree.h"

@interface CFViewController ()

@end

@implementation CFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    BSTree* MyTree = [[BSTree alloc] initWithVal:@20];
    [MyTree insert:@12];
    [MyTree insert:@6];
    [MyTree insert:@42];
    [MyTree insert:@35];
    [MyTree insert:@16];
    [MyTree insert:@30];
    if([MyTree doesExist:@30]){
        NSLog(@"Contains 30");
    }
    else {
        NSLog(@"No Contains 30");
    }
    if([MyTree doesExist:@40]){
        NSLog(@"Contains 40");
    }
    else {
        NSLog(@"No Contains 40");
    }
    for (NSNumber *obj in MyTree){
        NSLog(@"%@ :",obj);
    }
    NSLog(@"Succeeded in adopting fast enumeration protocol: u 'll get an A grade");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
