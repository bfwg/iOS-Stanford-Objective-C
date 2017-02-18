//
//  Deck.h
//  Matchismo
//
//  Created by Fan Jin on 2017-02-16.
//  Copyright © 2017 Fan Jin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;

@end
