//
//  Logic.m
//  NriderProgram
//
//  Created by Aaron Robeson on 3/11/14.
//  Copyright (c) 2014 Aaron Robeson. All rights reserved.
//

#import "Logic.h"
#include <stdlib.h>

@implementation Logic

-(void)setup
{
	int housesCount = 1;
	NSNumber *numberLine = @100;
	NSMutableArray  *arrayOfPointsOccupied = [NSMutableArray new];
	NSNumber *spaceForEachHouse = [NSNumber new];
	NSMutableSet *setOfOccupiedPlots = [NSMutableSet new];
	NSArray *arrayOfObjectsInSet = [NSArray new];
	
	int inc = 0;
	while (YES) {
		inc++;
		if (inc > 20) {
			goto outer;
		}
		// Reset values
		spaceForEachHouse = [NSNumber numberWithInt:[numberLine intValue] / housesCount];
		arrayOfObjectsInSet = [setOfOccupiedPlots allObjects];
		for (NSNumber *currentObject in arrayOfObjectsInSet){
			[setOfOccupiedPlots removeObject:currentObject];
		}
		arrayOfObjectsInSet = @[];
		
		// Check that no two houses occupy the same plot
		for (NSNumber *houseNumber in arrayOfPointsOccupied) {
			for (int i = 1; i <= housesCount; i++) {
				if ([spaceForEachHouse intValue] * (i-1) < [houseNumber intValue] && [houseNumber intValue] < [spaceForEachHouse intValue] * i) {
					if ([setOfOccupiedPlots containsObject:[NSNumber numberWithInt:i]]) {
						// Two houses in the same plot. Break out of all loops
						goto outer;
					}
					[setOfOccupiedPlots addObject:[NSNumber numberWithInt:i]];
				}
			}
		}
		// Place a new house randomly in unoccupied plot
		for (int i = 1; i <= housesCount; i++) {
			if (![setOfOccupiedPlots member:[NSNumber numberWithInt:i]]) {
				int minValueForHousePoint = [spaceForEachHouse intValue] * i-1;
				int randomPlacement = arc4random_uniform([spaceForEachHouse intValue] + 1);
				NSNumber *pointToAddToLine = [NSNumber numberWithInt:minValueForHousePoint + randomPlacement];
				[arrayOfPointsOccupied addObject:pointToAddToLine];
			}
		}
		
		// Add a house
		housesCount++;
	}
outer:;
	if (!_arrayOfHousesPlaced){
		_arrayOfHousesPlaced = [NSMutableArray new];
	}
	[_arrayOfHousesPlaced addObject:[NSNumber numberWithInt:housesCount]];
}

@end