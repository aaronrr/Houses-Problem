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
	float housesCount = 1;
	float numberLine = 1000;
	NSMutableArray  *arrayOfPointsOccupied = [NSMutableArray new];
	float spaceForEachHouse = 0;
	NSMutableSet *setOfOccupiedPlots = [NSMutableSet new];
	NSArray *arrayOfObjectsInSet = [NSArray new];
	
	while (YES) {

		// Reset values
		spaceForEachHouse = numberLine / housesCount;
		arrayOfObjectsInSet = [setOfOccupiedPlots allObjects];
		for (NSNumber *currentObject in arrayOfObjectsInSet){
			[setOfOccupiedPlots removeObject:currentObject];
		}
		arrayOfObjectsInSet = @[];
		
		// Check that no two houses occupy the same plot
		for (NSNumber *houseNumber in arrayOfPointsOccupied) {
			for (int i = 1; i <= housesCount; i++) {
				if (spaceForEachHouse * (i-1) < [houseNumber intValue] && [houseNumber intValue] < spaceForEachHouse * i) {
					if ([setOfOccupiedPlots containsObject:[NSNumber numberWithFloat:i]]) {
						// Two houses in the same plot. Break out of all loops
						goto outer;
					}
					[setOfOccupiedPlots addObject:[NSNumber numberWithFloat:i]];
				}
			}
		}

		// Place a new house randomly in unoccupied plot
		for (int i = 1; i <= housesCount; i++) {
			if (![setOfOccupiedPlots member:[NSNumber numberWithFloat:i]]) {
				float minValueForHousePoint = (spaceForEachHouse * (i-1));
				float randomPlacement = arc4random_uniform(spaceForEachHouse + 1);
				NSNumber *pointToAddToLine = [NSNumber numberWithInt:minValueForHousePoint + randomPlacement];
				[arrayOfPointsOccupied addObject:pointToAddToLine];
			}
		}
		
		// Add a house
		housesCount++;
	}
outer:;
	if (!_highestHousesCount) {
		_highestHousesCount = 0;
	}
	if (housesCount > _highestHousesCount){
		_highestHousesCount = housesCount;
		if (!_arrayOfBestValues) {
			_arrayOfBestValues = [NSMutableArray new];
		}
		_arrayOfBestValues = arrayOfPointsOccupied;
	}
@end