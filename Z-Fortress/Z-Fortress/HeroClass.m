//
//  HeroClass.m
//  Z-Fortress
//
//  Created by Raul Cano on 4/8/15.
//  Copyright (c) 2015 ECS 199. All rights reserved.
//

#import "HeroClass.h"

@implementation HeroClass


+ (NSMutableArray *)initializeHeroAnimations {

    NSMutableArray *heroAnimations = [[NSMutableArray alloc] init];

    NSMutableArray *heroAnimateUp = [GameScene extractSprites:@"dariusWalkingUp.png"];
    NSMutableArray *heroAnimateDown = [GameScene extractSprites:@"dariusWalkingDown.png"];
    NSMutableArray *heroAnimateLeft = [GameScene extractSprites:@"dariusWalkingLeft.png"];
    NSMutableArray *heroAnimateRight = [GameScene extractSprites:@"dariusWalkingRight.png"];

    [heroAnimations addObjectsFromArray:heroAnimateUp];
    [heroAnimations addObjectsFromArray:heroAnimateDown];
    [heroAnimations addObjectsFromArray:heroAnimateLeft];
    [heroAnimations addObjectsFromArray:heroAnimateRight];

    return heroAnimations;
}

+ (CGPoint)getHeroPosition:(SKSpriteNode *)hero {
    return hero.position;
}







+ (void)moveHero:(CGPoint *)touchLocation :(SKSpriteNode *)hero :(NSMutableArray *)heroAnimations {

    CGPoint heroPos = [HeroClass getHeroPosition:hero];


    SKAction *animateHero = [SKAction animateWithTextures:heroAnimations timePerFrame:0.25];

    //SKAction *moveHeroX = [SKAction moveTo:CGPointMake(touchLocation.x, heroPos.y) duration:1.5];
    //SKAction *moveHeroY = [SKAction moveTo:CGPointMake(touchLocation.x, touchLocation.y) duration:1.5];

    //SKAction *sequence = [SKAction sequence:@[moveHeroX, moveHeroY]];



    //[self.hero runAction:[SKAction repeatActionForever:animateHero]];
    //[self.hero runAction:sequence completion:^{
    //    [self.hero removeAllActions];
    //}];
    //heroPos = touchLocation;
    
    
    
    
}







@end
