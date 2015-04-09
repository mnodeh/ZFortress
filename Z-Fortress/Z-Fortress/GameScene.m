//
//  GameScene.m
//  Z-Fortress
//
//  Created by Mohamed Odeh on 4/7/15.
//  Copyright (c) 2015 ECS 199. All rights reserved.
//


// NOTES:
// Darius png: 32 x 32
// objectatIndex:0 starts at bottom of png image


#import "GameScene.h"

@interface GameScene()

@property SKNode *world;
@property SKSpriteNode *hero;
@property NSMutableArray *heroAnimations;


@end

@implementation GameScene

int tileEdge = 24;

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

- (void)loadHero {

    self.heroAnimations = [HeroClass initializeHeroAnimations];

    self.hero = [SKSpriteNode spriteNodeWithTexture:[self.heroAnimations objectAtIndex:1]];
    self.hero.position = CGPointMake(CGRectGetMidX(self.frame),
                                     CGRectGetMidY(self.frame));
    [self.world addChild:self.hero];
}


// CURR:
// 1. Work on moveHero so that it can be called in touchesBegan to move the character
// 2. Tie correct animation to directions depending on Hero movement
// 3. Make hero's speed unanimous in all directions












- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

    for (UITouch *touch in touches) {
        CGPoint touchLocation = [touch locationInNode:self];
        CGPoint heroPos = [HeroClass getHeroPosition:self.hero];
        //float newHeroPosX;
        //float newHeroPosY;

        /*

        // If new position x-coordinate is greater than hero's current position
        // move forward in that direction
        if (location.x > heroPos.x) {
            newHeroPosX = heroPos.x + (location.x - heroPos.x);
        }
        else {
            newHeroPosX = heroPos.x - location.x;
        }

        if (location.y > heroPos.y) {
            newHeroPosY = heroPos.y + (location.y - heroPos.y);

        }
        else {
            newHeroPosX = heroPos.x - location.x;
        }
         */



        //float newHeroPosX = heroPos.x + (location.x - heroPos.x);
        //float newHeroPosY = heroPos.y + (abs(heroPos.y - location.y)));
        SKAction *animateHero = [SKAction animateWithTextures:self.heroAnimations timePerFrame:0.25];

        SKAction *moveHeroX = [SKAction moveTo:CGPointMake(touchLocation.x, heroPos.y) duration:1.5];
        SKAction *moveHeroY = [SKAction moveTo:CGPointMake(touchLocation.x, touchLocation.y) duration:1.5];



        //SKAction *moveHeroX = [SKAction moveTo:CGPointMake(heroPos.x + (abs(heroPos.x - location.x)), heroPos.y) duration:2.5];
        //SKAction *moveHeroY = [SKAction moveTo:CGPointMake(heroPos.x, heroPos.y + (abs(heroPos.y - location.y))) duration:2.5];

        SKAction *sequence = [SKAction sequence:@[moveHeroX, moveHeroY]];


        [self.hero runAction:[SKAction repeatActionForever:animateHero]];
        [self.hero runAction:sequence completion:^{
            [self.hero removeAllActions];
        }];
        heroPos = touchLocation;

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
        [spriteArray addObject:[SKTexture textureWithRect:CGRectMake((float)i / numSprites, 0, 1.0 / numSprites, 1)
                                                inTexture:imageTexture]];
    }

    /*
     // Extract elements from vertical sprite sheet
     NSUInteger numSprites = imageTexture.size.height / imageTexture.size.width;
     NSMutableArray *spriteArray = [NSMutableArray arrayWithCapacity:numSprites];

     // Load sprites into array
     for (int i = 0; i < numSprites; i++) {
     [spriteArray addObject:[SKTexture textureWithRect:CGRectMake(0, (float)i / numSprites, 1, 1.0 / numSprites)
     inTexture:imageTexture]];
     }

     */

    return spriteArray;
}

- (void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
