//
//  BSTree.h
//  BinarySearchTree
//
//  Created by Christina Francis on 12/15/13.
//  Copyright (c) 2013 Christina Francis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyNode.h"

@interface BSTree : NSObject <NSFastEnumeration>

@property MyNode* root;

- (BSTree*) initWithVal:(NSNumber*) val;
- (void) insert:(NSNumber*) val;
- (BOOL) doesExist:(NSNumber*) val;


@end
