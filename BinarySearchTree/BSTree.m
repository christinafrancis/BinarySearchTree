//
//  BSTree.m
//  BinarySearchTree
//
//  Created by Christina Francis on 12/15/13.
//  Copyright (c) 2013 Christina Francis. All rights reserved.
//

#import "BSTree.h"

@implementation BSTree

- (BSTree*) initWithVal:(NSNumber*) val{
    self = [super init];
    if(self){
        _root = [[MyNode alloc] init];
        _root.val = val;
        _root.left = NULL;
        _root.right = NULL;
    }
    return  self;
    
}
- (void) insert:(NSNumber*) val{
    MyNode* currentNode= [[MyNode alloc] init];
    MyNode* tempNode= [[MyNode alloc] init];
    currentNode = _root;
    
    while(YES){
        if([currentNode.val compare: val] == NSOrderedAscending){
            if (currentNode.right == NULL) {
                tempNode.val = val;
                tempNode.right = NULL;
                tempNode.left = NULL;
                currentNode.right = tempNode;
                NSLog(@"inserting %@ to the right of %@",val,currentNode.val);
                return;
            }
            else{
                NSLog(@"right moving from%@",currentNode.val);
                currentNode  = currentNode.right;
                NSLog(@"right moving to%@",currentNode.val);
            }
        }
        else{
            if (currentNode.left == NULL) {
                tempNode.val = val;
                tempNode.right = NULL;
                tempNode.left = NULL;
                currentNode.left = tempNode;
                NSLog(@"inserting %@ to the left of %@",val,currentNode.val);
                return;
            }
            else{
                NSLog(@"left moving from%@",currentNode.val);
                currentNode  = currentNode.left;
                NSLog(@"left moving to%@",currentNode.val);
            }
        }
    }

    
}
- (BOOL) doesExist:(NSNumber*) val{
      MyNode* currentNode= [[MyNode alloc] init];
    currentNode = _root;
    while(YES){
        if([currentNode.val isEqualToNumber:val]){
            return YES;
        }
        else if([currentNode.val compare: val] == NSOrderedAscending){
            if (currentNode.right == NULL) {
                return NO;
            }
            else{
                currentNode  = currentNode.right;
            }
        }
        else {
            if (currentNode.left == NULL) {
                return NO;
            }
            else{
                currentNode  = currentNode.left;
            }
        }
        
    }
    
}
static NSMutableArray * buff;

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:( __unsafe_unretained id *)buffer count:(NSUInteger)len
{
      if(state->state > 0) return 0;
    
    buff = [[NSMutableArray alloc] initWithCapacity:20];
    in_order_traversal(_root);
   // [buff addObject:@101];
    len = [buff count];
    // plan of action: extra[0] will contain pointer to node
    // that contains next object to iterate
    NSUInteger c = 0;
    while (c < len) {
        __unsafe_unretained id obj = [buff objectAtIndex:c];
        
        buffer[c] = obj;
        c++;
   
        state->state++;
    }
    state->itemsPtr = buffer;
    state->mutationsPtr =  &state->extra[0];
    return c;
}


void in_order_traversal(MyNode *p) {
    if (!p){
     
        return;
    }
    in_order_traversal(p.left);
    [buff addObject: p.val ];
    in_order_traversal(p.right );
}
@end
