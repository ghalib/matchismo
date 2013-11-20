//
//  PlayingCardGameViewController.m
//  Matchismo
//
//  Created by ghalib on 11/20/13.
//  Copyright (c) 2013 Zift LLC. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"

@interface PlayingCardGameViewController ()

@end

@implementation PlayingCardGameViewController

- (Deck*) createDeck
{
    return [[PlayingCardDeck alloc] init];
}
@end
