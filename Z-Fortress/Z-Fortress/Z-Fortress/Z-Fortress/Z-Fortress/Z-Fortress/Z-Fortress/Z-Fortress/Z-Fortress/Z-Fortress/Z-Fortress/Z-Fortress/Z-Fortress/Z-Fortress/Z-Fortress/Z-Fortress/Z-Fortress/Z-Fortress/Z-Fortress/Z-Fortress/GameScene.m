//
//  GameScene.m
//  Z-Fortress
//
//  Copyright (c) 2015 ECS 199. All rights reserved.
//


// NOTES:
// Darius png: 32 x 32
// objectatIndex:0 starts at bottom of png image


#import "GameScene.h"
#import "Grid.h"

@interface GameScene()

@property SKNode *world;
@property Hero *hero;

@end

@implementation GameScene

int tileEdge = 32;
// ---- 12 ----
// |
// |
// 21
// |
// |
// [col][row]
int gridLayout[21][12];


- (void)didMoveToView:(SKView *)view {

    [self loadMap];
    //[Grid initializeGrid:gridLayout];
    //[Grid printGrid:gridLayout];
    [self loadHero];
    
    
}





- (void)loadMap {
    
    //Map canvas
    self.world = [SKNode node];
    [self addChild:self.world];
    
    //Load grass onto world node
    int x = 12;
    for (int i = 0; i < 12  ; i++) {
        int y = 12;
        for (int j = 0; j < 21; j++) {
            if (i%2 && j%2) {
                SKSpriteNode *grassTile = [SKSpriteNode spriteNodeWithImageNamed:@"grassTile.png"];
                grassTile.size = CGSizeMake(32, 32);
                grassTile.position = CGPointMake(x, y);
                [self.world addChild:grassTile];
            }

            y += tileEdge;
        }
        x += tileEdge;
    }
}

- (void)loadHero {
    
    self.hero = [Hero hero];
    [self.world addChild:self.hero];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

    for (UITouch *touch in touches) {
        CGPoint touchLocation = [touch locationInNode:self];
        SKSpriteNode *spriteLocation = (SKSpriteNode*)[self nodeAtPoint:touchLocation];




        CGPoint newPosition = [self snapToPosition:spriteLocation];
        CGPoint gridPosition = [Grid getGridPos:newPosition];
        //NSLog(@"X: %i,  Y: %i ", (int)gridPosition.x, (int)gridPosition.y);
        [Grid markGridLocation:gridLayout :gridPosition];
        [Grid printGrid:gridLayout];
        [Grid resetGridLocation:gridLayout :gridPosition];


        [self.hero removeAllActions];
        [self.hero walkTo:newPosition];
    }
}

// Extracts sprites from vertical sheet
+ (NSMutableArray *)extractSprites:(NSString *)spriteFileName {

    SKTexture *imageTexture = [SKTexture textureWithImageNamed:spriteFileName];
    imageTexture.filteringMode = SKTextureFilteringNearest;

    // Extract elements from horizontal sprite sheet
    NSUInteger numSprites = imageTexture.size.width / imageTexture.size.height;
    NSMutableArray *spriteArray = [NSMutableArray arrayWithCapacity:numSprites];

    // Load sprites into array
    for (int i = 0; i < numSprites; i++) {
        [spriteArray addObject:[SKTexture textureWithRect:CGRectMake((float)i / numSprites, 0, 1.0 / numSprites, 1) inTexture:imageTexture]];
    }

    return spriteArray;
}

-(CGPoint)snapToPosition:(SKSpriteNode *)spriteLocation {
    CGPoint newPosition;
    
    newPosition.x = 12 + 32 * floor((spriteLocation.position.x / 32) + 0.5);
    newPosition.y = 12 + 32 * floor((spriteLocation.position.y / 32) + 0.5);

    return newPosition;
}



- (void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}















@end
