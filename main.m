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
		for (int i = 0; i < 50000000; i++) {
			[myLogic setup];
		}
		NSLog(@"\nHighest Value = %d\nWith Set: %@", [myLogic highestHousesCount], [myLogic arrayOfBestValues]);
	}
    return 0;
}

