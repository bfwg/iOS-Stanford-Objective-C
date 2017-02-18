//
//  Card.m
//  Matchismo
//
//  Created by Fan Jin on 2017-02-15.
//  Copyright © 2017 Fan Jin. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)match:(NSArray *)otherCards {
    
    int score = 0;
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    return score;
}

@end
