//
//  CardGameViewController.h
//  Matchismo
//
//  Created by ghalib on 11/6/13.
//  Copyright (c) 2013 Zift LLC. All rights reserved.
//
//  Abstract class. Must implement methods below.

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface CardGameViewController : UIViewController

// protected
// for subclasses
- (Deck *)createDeck; //abstract
- (NSUInteger)requiredCardMatch;

@end
