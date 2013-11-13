//
//  Card.h
//  Matchismo
//
//  Created by ghalib on 11/6/13.
//  Copyright (c) 2013 Zift LLC. All rights reserved.
//

@import Foundation;

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter = isChosen) BOOL chosen;
@property (nonatomic, getter = isMatched) BOOL matched;

- (int)match:(NSArray *)otherCards;

@end
