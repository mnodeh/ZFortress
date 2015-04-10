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

@interface GameScene()

@property SKNode *world;
@property Hero *hero;

@end

@implementation GameScene

int tileEdge = 32;

- (void)didMoveToView:(SKView *)view {
    
    [self loadMap];
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
            SKSpriteNode *grassTile = [SKSpriteNode spriteNodeWithImageNamed:@"grassTile.png"];
            grassTile.size = CGSizeMake(32, 32);
            grassTile.position = CGPointMake(x, y);
            [self.world addChild:grassTile];
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
        
        [self.hero removeAllActions];
        [self.hero walkTo:touchLocation];
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

- (void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
