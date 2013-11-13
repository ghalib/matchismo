//
//  Card.m
//  Matchismo
//
//  Created by ghalib on 11/6/13.
//  Copyright (c) 2013 Zift LLC. All rights reserved.
//

#import "Card.h"

@interface Card()

@end

@implementation Card

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    
    return score;
}

@end
