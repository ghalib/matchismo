//
//  SetCard.m
//  Matchismo
//
//  Created by ghalib on 11/21/13.
//  Copyright (c) 2013 Zift LLC. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

- (NSString *)contents
{
    return self.suit;
}

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    for (SetCard *otherCard in otherCards) {
        if (otherCard.suit == self.suit) {
            score += 4;
        }
    }
    return score;
}


+ (NSArray *)validSuits
{
    return @[@"△", @"▢", @"◯"];
}

@synthesize suit = _suit;

- (void)setSuit:(NSString *)suit
{
    if ([[SetCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}


@end
