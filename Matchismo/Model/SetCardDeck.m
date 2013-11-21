//
//  SetCardDeck.m
//  Matchismo
//
//  Created by ghalib on 11/21/13.
//  Copyright (c) 2013 Zift LLC. All rights reserved.
//

#import "SetCardDeck.h"
#import "SetCard.h"

@implementation SetCardDeck

- (instancetype)init
{
    self = [super init];
    if (self) {
        int deckSize = 51;
        // Let's hardcode 51 cards
        for (int i = 0; i < deckSize / [[SetCard validSuits] count]; i++) {
            for (NSString* suit in [SetCard validSuits]) {
                SetCard *card = [[SetCard alloc] init];
                card.suit = suit;
                [self addCard:card];
            }
        }
    }
    return self;
}


@end
