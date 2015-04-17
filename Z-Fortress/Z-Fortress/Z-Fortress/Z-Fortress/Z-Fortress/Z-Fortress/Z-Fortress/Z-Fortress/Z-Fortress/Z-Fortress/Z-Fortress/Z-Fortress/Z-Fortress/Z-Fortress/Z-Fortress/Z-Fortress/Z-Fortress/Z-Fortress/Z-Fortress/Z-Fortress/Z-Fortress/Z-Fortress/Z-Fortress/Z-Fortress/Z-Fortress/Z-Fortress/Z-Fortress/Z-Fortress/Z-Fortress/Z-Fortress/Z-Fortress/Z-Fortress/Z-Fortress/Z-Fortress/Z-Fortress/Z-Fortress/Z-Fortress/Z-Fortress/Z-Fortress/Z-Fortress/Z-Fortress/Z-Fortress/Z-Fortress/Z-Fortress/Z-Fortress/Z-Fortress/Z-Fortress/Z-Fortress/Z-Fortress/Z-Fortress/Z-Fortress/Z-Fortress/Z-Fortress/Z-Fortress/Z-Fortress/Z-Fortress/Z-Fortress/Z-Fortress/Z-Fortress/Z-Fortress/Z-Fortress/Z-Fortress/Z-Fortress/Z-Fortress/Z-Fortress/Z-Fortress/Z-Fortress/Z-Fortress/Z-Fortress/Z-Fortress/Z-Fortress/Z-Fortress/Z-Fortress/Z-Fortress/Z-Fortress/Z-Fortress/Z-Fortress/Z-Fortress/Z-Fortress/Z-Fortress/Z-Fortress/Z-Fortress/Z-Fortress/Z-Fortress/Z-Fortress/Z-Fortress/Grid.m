//
//  Grid.m
//  Z-Fortress
//
//  Created by Raul Cano on 4/16/15.
//  Copyright (c) 2015 ECS 199. All rights reserved.
//

#import "Grid.h"
//#import "GameScene.h"

@implementation Grid
// 0 = invalid
// 1 = OK
// 2 = current travel point


+ (void)printGrid:(int [21][12])arr {

    printf("\n");
    
    for (int i = 0; i < 21  ; i++) {
        //int y = 12;
        for (int j = 0; j < 12; j++) {

            // ###
            printf("%i ", arr[i][j]);
            //y += tileEdge;
        }
        //x += tileEdge;
        printf("\n");
    }
    //printf("\n");

}

+ (void)initializeGrid:(int [21][12])arr {



    for (int i = 0; i < 21  ; i++) {
        for (int j = 0; j < 12; j++) {
            arr[i][j] = 1;

            //NSLog(@"%i", arr[i][j]);
        }
    }

}


+ (void)markGridLocation:(int [21][12])arr :(CGPoint)position {
    arr[(int)position.y][(int)position.x] = 2;

}


+ (void)resetGridLocation:(int [21][12])arr :(CGPoint)position {
    arr[(int)position.y][(int)position.x] = 0;

}
+ (CGPoint)getGridPos:(CGPoint)position {
    CGPoint gridPosition;

    gridPosition.x = floor(position.x/32);
    // Inverted
    gridPosition.y = 20 - floor((position.y/32));

    return gridPosition;
}


@end
