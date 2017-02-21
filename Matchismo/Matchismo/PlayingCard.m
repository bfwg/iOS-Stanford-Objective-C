//
//  PlayCard.m
//  Matchismo
//
//  Created by Fan Jin on 2017-02-16.
//  Copyright © 2017 Fan Jin. All rights reserved.
//

#include <math.h>
#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit = _suit;

+ (NSArray *)validSuit {
    return @[@"❤️",@"♦️",@"♠️",@"♣️"];
}

+ (NSArray *)rankStrings {
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger)maxRank {
    return [[PlayingCard rankStrings] count] - 1;
}

- (int)match:(NSArray *)otherCards {
    NSInteger score = 0;
    BOOL loopDone = NO;
    for (PlayingCard *card in otherCards) {
        if (self.rank == card.rank) {
            score += 4;
        } else if ([self.suit isEqualToString:card.suit]) {
            score += 1;
        } else {
            score = 0;
            break;
        }
        NSUInteger index = [otherCards indexOfObject:card];
        for (NSInteger j = index; j < [otherCards count]; j++) {
            if (j == [otherCards count] - 1) {
                break;
            } else {
                PlayingCard *otherCard = otherCards[j + 1];
                if (card.rank == otherCard.rank) {
                    score += 4;
                } else if ([card.suit isEqualToString:otherCard.suit]) {
                    score += 1;
                } else {
                    score = 0;
                    loopDone = YES;
                    break;
                }
            }
        }
        if (loopDone) {
            break;
        }
    }
    return pow(score, [otherCards count]);
}

- (NSString *)contents {
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

- (void)setSuit:(NSString *)suit {
    if([[PlayingCard validSuit] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *)suit {
    return _suit ? _suit : @"?";
}

- (void)setRank:(NSUInteger)rank {
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}


@end
