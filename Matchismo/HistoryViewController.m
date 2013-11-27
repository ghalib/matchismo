//
//  HistoryViewController.m
//  Matchismo
//
//  Created by ghalib on 11/22/13.
//  Copyright (c) 2013 Zift LLC. All rights reserved.
//

#import "HistoryViewController.h"

@interface HistoryViewController ()

@end

@implementation HistoryViewController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.matchHistory count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier ];
    NSString *matchStatus = [self.matchHistory objectAtIndex:indexPath.row];
    cell.textLabel.text = matchStatus;
    return cell;
}

@end
