//
//  Grid.h
//  Z-Fortress
//
//  Created by Raul Cano on 4/16/15.
//  Copyright (c) 2015 ECS 199. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameScene.h"

// INTERFACE
@interface Grid : NSObject


+ (void)printGrid:(int [21][12])arr;
+ (void)initializeGrid:(int [21][12])arr;

// travel to location
+ (void)markGridLocation:(int [21][12])arr :(CGPoint)position;
+ (void)resetGridLocation:(int [21][12])arr :(CGPoint)position;


+ (CGPoint)getGridPos:(CGPoint)position;





//-(void)setNodeForTestingDFSX:(gridNode *)node :(char)newDFSX;
//-(char)getNodeForTestingDFSX:(gridNode *)node;




@end

