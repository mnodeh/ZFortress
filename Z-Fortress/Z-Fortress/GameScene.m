//
//  GameScene.m
//  Z-Fortress
//
//  Created by Mohamed Odeh on 4/7/15.
//  Copyright (c) 2015 ECS 199. All rights reserved.
//

#import "GameScene.h"

@interface GameScene()

@property SKNode *world;

@end

@implementation GameScene

int tileEdge = 24;

- (void)didMoveToView:(SKView *)view {
    
    [self loadMap];
    
}

- (void)loadMap {
    
    //Map canvas
    self.world = [SKNode node];
    [self addChild:self.world];
    
    //Load grass onto world node
    int x = 12;
    for (int i = 0; i < 16  ; i++) {
        int y = 12;
        for (int j = 0; j < 28; j++) {
            SKSpriteNode *grassTile = [SKSpriteNode spriteNodeWithImageNamed:@"grassTile.png"];
            grassTile.position = CGPointMake(x, y);
            [self.world addChild:grassTile];
            y += tileEdge;
        }
        x += tileEdge;
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
}

- (void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
