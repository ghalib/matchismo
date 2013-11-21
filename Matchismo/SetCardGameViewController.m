//
//  SetCardGameViewController.m
//  Matchismo
//
//  Created by ghalib on 11/21/13.
//  Copyright (c) 2013 Zift LLC. All rights reserved.
//

#import "SetCardGameViewController.h"
#import "SetCardDeck.h"

@interface SetCardGameViewController ()

@end

@implementation SetCardGameViewController

- (Deck*) createDeck
{
    return [[SetCardDeck alloc] init];
}

@end
