//
//  main.m
//  NriderProgram
//
//  Created by Aaron Robeson on 3/11/14.
//  Copyright (c) 2014 Aaron Robeson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Logic.h"

int main(int argc, const char * argv[])
{

	@autoreleasepool {
	    
	    // Run program x times
		Logic *myLogic = [[Logic alloc]init];
		for (int i = 0; i < 500000; i++) {
			[myLogic setup];
		}
		
		// Find highest value
		int highestValue = 0;
		for (NSNumber *currentNumber in [myLogic arrayOfHousesPlaced]){
			if ([currentNumber intValue] > highestValue) {
				highestValue = [currentNumber intValue];
			}
		}
		
		// Find mean
		int sum = 0;
		for (NSNumber *currentNumber in [myLogic arrayOfHousesPlaced]){
			sum += [currentNumber intValue];
		}
		int mean = sum / [[myLogic arrayOfHousesPlaced] count];
		
		NSLog(@"\n\n Highest value = %d\n\nMean = %d", highestValue, mean);
	}
    return 0;
}

