//
//  Card.h
//  Matchismo
//
//  Created by Fan Jin on 2017-02-15.
//  Copyright © 2017 Fan Jin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

- (int)match: (NSArray *)otherCards;

@end
