//
//  Hero.h
//  Z-Fortress
//
//  Copyright (c) 2015 ECS 199. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GameScene.h"

@interface Hero : SKSpriteNode

+ (id)hero;
- (NSMutableArray *)initializeHeroWalk:(NSString *)direction;
- (void)walkTo: (CGPoint)destination;

@end
