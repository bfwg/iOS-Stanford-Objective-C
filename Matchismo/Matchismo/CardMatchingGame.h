//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Fan Jin on 2017-02-18.
//  Copyright © 2017 Fan Jin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

@property (nonatomic, readonly) NSInteger score;

@property (strong, nonatomic, readonly) NSString *scoreMessage;

-(instancetype)initWithCardCount:(NSUInteger)count usingDesck:(Deck *)deck matchingSize:(NSUInteger)size;

-(void)chooseCardAtIndex:(NSUInteger)index;

-(Card *)cardAtIndex:(NSUInteger)index;


@end
