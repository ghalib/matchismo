//
//  CardGameViewController.m
//  Matchismo
//
//  Created by ghalib on 11/6/13.
//  Copyright (c) 2013 Zift LLC. All rights reserved.
//

#import "CardGameViewController.h"
#import "CardMatchingGame.h"
#import "HistoryViewController.h"

@interface CardGameViewController ()
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *matchStatus;
@property (weak, nonatomic) IBOutlet UILabel *cardStatus;
@end

@implementation CardGameViewController

- (CardMatchingGame *)game
{
    if (!_game)
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                  usingDeck:[self createDeck]
                                           requiredCardMatch:[self requiredCardMatch]];
    return _game;
}

- (Deck *)createDeck
{
    return nil;
}

- (NSUInteger)requiredCardMatch
{
    return 2;
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
    self.cardStatus.text = @"";
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
}

- (void)updateUI
{
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
}

- (NSString *)titleForCard:(Card *)card
{
    return card.isChosen ? card.contents : @"";
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowHistory"]) {
        if ([segue.destinationViewController isKindOfClass:[HistoryViewController class]]) {
            HistoryViewController *historyVC = segue.destinationViewController;
            historyVC.matchHistory = self.game.matchHistory;
        }
    }
}
@end
