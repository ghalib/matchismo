//
//  Deck.h
//  Matchismo
//
//  Created by ghalib on 11/6/13.
//  Copyright (c) 2013 Zift LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;

@end
