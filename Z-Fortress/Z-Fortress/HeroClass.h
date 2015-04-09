//
//  HeroClass.h
//  Z-Fortress
//
//  Created by Raul Cano on 4/8/15.
//  Copyright (c) 2015 ECS 199. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <SpriteKit/SpriteKit.h>
#import "GameScene.h"


// SKNode
@interface HeroClass : NSObject

+ (NSMutableArray *)initializeHeroAnimations;
+ (CGPoint)getHeroPosition:(SKSpriteNode *)hero;
+ (void)moveHero:(CGPoint *)touchLocation :(SKSpriteNode *)hero :(NSMutableArray *)heroAnimations;

@end
