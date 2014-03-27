//
//  Logic.h
//  NriderProgram
//
//  Created by Aaron Robeson on 3/11/14.
//  Copyright (c) 2014 Aaron Robeson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Logic : NSObject

@property (nonatomic) int highestHousesCount;
@property (nonatomic, strong) NSMutableArray *arrayOfHousesPlaced;
@property (nonatomic, strong) NSMutableArray *arrayOfBestValues;
-(void) setup;

@end
