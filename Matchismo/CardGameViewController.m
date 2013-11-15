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
@property (weak, nonatomic) IBOutlet UILabel *matchStatus;
@property (weak, nonatomic) IBOutlet UILabel *cardStatus;
@property (weak, nonatomic) IBOutlet UISlider *slider;
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
    self.scoreLabel.text = @"Score: 0";
    self.matchStatus.text = @"";
    self.game = nil;
    self.gameSelector.enabled = YES;
    self.slider.enabled = NO;
    self.slider.minimumValue = 0;
    self.slider.maximumValue = 0;
    self.slider.value = 0;
    self.cardStatus.text = @"";
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
- (IBAction)slider:(UISlider *)sender {
    int historyIndex = (int)floor(sender.value);
    self.cardStatus.text = self.game.cardHistory[historyIndex];
    self.cardStatus.alpha = 0.7;
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
    }
    self.cardStatus.alpha = 1.0;
    self.scoreLabel.text= [NSString stringWithFormat:@"Score: %d",
                           self.game.score];
    self.cardStatus.text = self.game.cardStatus;
    self.matchStatus.text = self.game.lastMatchStatus;
    if ([self.game.cardHistory count] > 1) {
        self.slider.enabled = YES;
        self.slider.maximumValue = [self.game.cardHistory count] - 1;
        self.slider.value = self.slider.maximumValue;
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
