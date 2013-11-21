//
//  SetCard.h
//  Matchismo
//
//  Created by ghalib on 11/21/13.
//  Copyright (c) 2013 Zift LLC. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card

@property (strong, nonatomic) NSString *suit;

+ (NSArray *)validSuits;

@end
