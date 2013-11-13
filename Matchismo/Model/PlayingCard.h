//
//  PlayingCard.h
//  Matchismo
//
//  Created by ghalib on 11/7/13.
//  Copyright (c) 2013 Zift LLC. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
