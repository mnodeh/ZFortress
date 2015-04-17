//
//  Hero.m
//  Z-Fortress
//
//  Copyright (c) 2015 ECS 199. All rights reserved.
//

#import "Hero.h"

@interface Hero()

@property NSMutableArray *heroWalk;

@end


@implementation Hero

Hero *hero;

+ (id)hero {
    
    NSMutableArray *initialHero = [GameScene extractSprites:@"heroWalkDown.png"];
    hero = [Hero spriteNodeWithTexture: initialHero[1]];
    hero.position = CGPointMake(44, 44);
    hero.name = @"hero";
    
    return hero;
}

- (NSMutableArray *)initializeHeroWalk: (NSString *)direction{
    
    self.heroWalk = [GameScene extractSprites:direction];
    
    return self.heroWalk;
}

- (void)walkTo: (CGPoint)destination {
    
    NSString *walkDirectionX, *walkDirectionY;
    
    if (destination.x > hero.position.x)
        walkDirectionX = @"heroWalkRight.png";
    else
        walkDirectionX = @"heroWalkLeft.png";
    
    if (destination.y > hero.position.y)
        walkDirectionY = @"heroWalkUp.png";
    else
        walkDirectionY = @"heroWalkDown.png";
    
    //Get the distance between the destination position and the hero's position
    double distanceX = sqrt(pow((destination.x - hero.position.x), 2.0));
    double distanceY = sqrt(pow((destination.y - hero.position.y), 2.0));
    
    float moveDurationX = .01 * distanceX;
    float moveDurationY = .01 * distanceY;
    
    SKAction *moveHeroToX = [SKAction moveTo:CGPointMake(destination.x, hero.position.y) duration:moveDurationX];
    SKAction *moveHeroToY = [SKAction moveTo:CGPointMake(destination.x, destination.y) duration:moveDurationY];

    SKAction *walkY = [SKAction animateWithTextures:[self initializeHeroWalk:walkDirectionY] timePerFrame:0.25];
    SKAction *walkX = [SKAction animateWithTextures:[self initializeHeroWalk:walkDirectionX] timePerFrame:0.25];
    
    [hero runAction:[SKAction repeatActionForever:walkX]];
    [hero runAction:moveHeroToX completion:^(void){
        [hero removeAllActions];
        [hero runAction:[SKAction repeatActionForever:walkY]];
        [hero runAction:moveHeroToY completion:^(void){
            [hero removeAllActions];
            [hero runAction:[SKAction setTexture:[self initializeHeroWalk:walkDirectionY][1]]];
        }];
    }];
    
}




@end
