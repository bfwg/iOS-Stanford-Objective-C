//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Fan Jin on 2017-02-18.
//  Copyright © 2017 Fan Jin. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property (strong, nonatomic) NSMutableArray *cards;
@property (nonatomic) NSInteger matchingSize;
@property (nonatomic, readwrite) NSInteger score;
@property (strong, nonatomic, readwrite) NSString *scoreMessage;

@end

@implementation CardMatchingGame
static const int COST_TO_CHOOSE = 1;
static const int MISMATCH_PENALITY = 2;
static const int MATCH_BONES = 4;

-(NSMutableArray *)cards {
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

-(void)setScoreMessage:(char)operator
                 score:(NSInteger)score
               because:(NSString *)reason {
    _scoreMessage = [NSString stringWithFormat:@"Socre %c%ld, %@", operator, score, reason];
}

-(instancetype)initWithCardCount:(NSUInteger)count usingDesck:(Deck *)deck matchingSize:(NSUInteger)size {
    
    self = [super init];
    
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
        self.matchingSize = size;
    }
    return self;
}

-(void)chooseCardAtIndex:(NSUInteger)index {
    
    Card *card = [self cardAtIndex:index];
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            // chose card message
            [self setScoreMessage:'-'
                            score:COST_TO_CHOOSE
                          because:@"Cost to Choose"];
            
            // alloc other chosen cards
            NSMutableArray *otherCards = [[NSMutableArray alloc] init];
            for (Card *otherCard in self.cards) {
                // other chosen cards
                if (otherCard.isChosen && !otherCard.isMatched) {
                    // add other chosen cards in to an array
                    [otherCards addObject:otherCard];
                    // if we got enough chosen cards, we test to see if they match
                    if ([otherCards count] == self.matchingSize - 1) {
                        int matchScore = [card match:otherCards];
                        // add point 
                        if (matchScore) {
                            self.score += matchScore * MATCH_BONES;
                            for (Card *otherCard in otherCards) {
                                otherCard.matched = YES;
                                card.matched = YES;
                            }
                            // preparing matching result messaging
                            NSMutableArray *matchedCards = otherCards;
                            [matchedCards addObject:card];
                            NSString *resultMessage =  [[matchedCards valueForKey:@"contents"] componentsJoinedByString:@", "];
                            [self setScoreMessage:'+'
                                            score:matchScore * MATCH_BONES
                                          because:[NSString stringWithFormat:@"%@ are matching!", resultMessage]];
                        } else {
                            // drop point 
                            self.score -= MISMATCH_PENALITY;
                            [self setScoreMessage:'-'
                                            score:MISMATCH_PENALITY
                                          because:@"Mismatch Penality"];
                            for (Card *otherCard in otherCards) {
                                otherCard.chosen = NO;
                            }
                            //card.chosen = NO;
                        }
                    }
                }
            }
        }
        self.score -= COST_TO_CHOOSE;
        card.chosen = YES;
    }
}

-(Card *)cardAtIndex:(NSUInteger)index {
    return (index <= [self.cards count]) ? self.cards[index] : nil;
}

@end
