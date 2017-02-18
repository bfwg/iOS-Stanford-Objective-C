//
//  PlayCard.h
//  Matchismo
//
//  Created by Fan Jin on 2017-02-16.
//  Copyright © 2017 Fan Jin. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuit;

+ (NSArray *)rankStrings;

+ (NSUInteger)maxRank;

@end
