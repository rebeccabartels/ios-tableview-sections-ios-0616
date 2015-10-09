//
//  FISStudent.h
//  ios-tableview-sections
//
//  Created by Tom OMalley on 5/28/15.
//  Copyright (c) 2015 The Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISStudent : NSObject
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSArray *favoriteThings;

// ADVANCED
@property (strong, nonatomic) NSString *favoriteFood;
@property (strong, nonatomic) NSString *favoriteColor;
@property (strong, nonatomic) NSString *favoriteMusicalArtist;
@property (strong, nonatomic) NSString *favoriteGame;

@end
