//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by ghalib on 11/8/13.
//  Copyright (c) 2013 Zift LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

// designated initialiser
- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck
                        requiredCardMatch:(NSUInteger)requiredCardMatch;

- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;
// gameType = 2 or 3, i.e. match 2 cards or match 3
@property (nonatomic, readwrite) NSUInteger gameType;
@property (nonatomic, readonly) NSString *lastMatchStatus;
@property (nonatomic, readonly) NSString *cardStatus;
@property (nonatomic, readonly) NSMutableArray *cardHistory;
@end
