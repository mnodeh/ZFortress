//
//  GameScene.h
//  Z-Fortress
//
//  Copyright (c) 2015 ECS 199. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Hero.h"


@interface GameScene : SKScene

- (void)loadMap;
- (void)loadHero;
+ (NSMutableArray *)extractSprites:(NSString *)spriteFileName;

@end
