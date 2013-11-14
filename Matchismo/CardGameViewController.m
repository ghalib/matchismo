//
//  CardGameViewController.m
//  Matchismo
//
//  Created by ghalib on 11/6/13.
//  Copyright (c) 2013 Zift LLC. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *gameSelector;
@end

@implementation CardGameViewController

- (CardMatchingGame *)game
{
    if (!_game)
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                  usingDeck:[self createDeck]];
    return _game;
}

- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}

- (IBAction)newGame:(id)sender {
    // First, return all cards to face down
    for (UIButton *cardButton in self.cardButtons) {
        [cardButton setTitle:@"" forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[UIImage imageNamed:@"cardback"]
                              forState:UIControlStateNormal];
        cardButton.enabled = YES;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: 0"];
    self.game = nil;
    self.gameSelector.enabled = YES;
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
}

- (IBAction)gameSelector:(UISegmentedControl *)sender {
    if ([sender selectedSegmentIndex] == 0) {
        self.game.gameType = 2;
    } else {
        self.game.gameType = 3;
    }
}

- (void)updateUI
{
    self.gameSelector.enabled = NO;
    for (UIButton *cardButton in self.cardButtons) {
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card]
                    forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card]
                              forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text= [NSString stringWithFormat:@"Score: %d",
                               self.game.score];
    }
}

- (NSString *)titleForCard:(Card *)card
{
    return card.isChosen ? card.contents : @"";
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}
@end
