//
//  FISTableViewController.m
//  ios-tableview-sections
//
//  Created by Tom OMalley on 5/28/15.
//  Copyright (c) 2015 The Flatiron School. All rights reserved.
//

#import "FISTableViewController.h"
#import "FISStudent.h"

@interface FISTableViewController ()
@property (strong, nonatomic) NSArray *students;
@property (nonatomic) BOOL advanced; // set this to YES to see advanced.
@end

@implementation FISTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FISStudent *tom = [[FISStudent alloc] init];
    FISStudent *jim = [[FISStudent alloc] init];
    FISStudent *mrk = [[FISStudent alloc] init];
    FISStudent *tim = [[FISStudent alloc] init];
    FISStudent *joe = [[FISStudent alloc] init];
    
    tom.name = @"Tom";
    jim.name = @"Jimmy C";
    mrk.name = @"Mark";
    tim.name = @"Tim";
    joe.name = @"Joseph M. Burgess";
    
    tom.favoriteThings = @[@"rollin with the homies", @"nerd stuff (iOS)", @"video games (zelda!)", @"drums (playing/listening)"];
    jim.favoriteThings = @[@"buying apple products", @"board games", @"goin on dates", @"not being an accountant"];
    mrk.favoriteThings = @[@"books/the english language", @"having a ponytail", @"Dungeons & Dragons", @"core data"];
    tim.favoriteThings = @[@"corgi puppies", @"sunshine", @"milkshakes", @"communism", @"banana dog"];
    joe.favoriteThings = @[@"PEANUT BUTTER", @"the idea of hiring an IT person", @"woodworking", @"teaching", @"barcade"];

    self.students = @[tom, jim, mrk, tim, joe];
    
    self.advanced = NO; // HERE'S WHERE YOU SPECIFY ADVANCED
    
    if (self.advanced)
        [self setupAdvancedPropertiesForStudents:@[tom, jim, mrk, tim, joe]];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return (NSInteger)self.students.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.advanced)
        return 4;
    
    FISStudent *thisSectionsStudent = self.students[(NSUInteger)section];
    return (NSInteger)thisSectionsStudent.favoriteThings.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"basicCell" forIndexPath:indexPath];
    
    FISStudent *thisSectionsStudent = self.students[(NSUInteger)indexPath.section];
    
    NSString *thisFavoriteThing = thisSectionsStudent.favoriteThings[(NSUInteger)indexPath.row];
    cell.textLabel.text = thisFavoriteThing;
    cell.detailTextLabel.text = [NSString stringWithFormat: @"%ld", indexPath.row + 1];
    
    
    if (self.advanced){
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = [NSString stringWithFormat: @"Food: %@", thisSectionsStudent.favoriteFood];
                break;
            case 1:
                cell.textLabel.text = [NSString stringWithFormat: @"Color: %@", thisSectionsStudent.favoriteColor];
                break;
            case 2:
                cell.textLabel.text = [NSString stringWithFormat: @"Musical Artist: %@", thisSectionsStudent.favoriteMusicalArtist];
                break;
            case 3:
                cell.textLabel.text = [NSString stringWithFormat: @"Game: %@", thisSectionsStudent.favoriteGame];
                break;
            default:
                cell.textLabel.text = @"Fix numberOfRowsInSection";
                break;
        }
    }
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return ((FISStudent*) self.students[(NSUInteger)section]).name;
}

-(NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 2;
}

#pragma mark - Helper

-(void)setupAdvancedPropertiesForStudents: (NSArray*) students
{
    for (FISStudent* student in students)
    {
        if([student.name isEqualToString:@"Tom"])
        {
            student.favoriteFood = @"Chicken/Cheese";
            student.favoriteColor = @"Red";
            student.favoriteMusicalArtist = @"Albert Hammond Jr.";
            student.favoriteGame = @"LoZ: Ocarina Of Time";
        }
        else if([student.name isEqualToString:@"Jimmy C"])
        {
            student.favoriteFood = @"Penne alla Vodka";
            student.favoriteColor = @"Purple";
            student.favoriteMusicalArtist = @"Phil Collins";
            student.favoriteGame = @"Starcraft";
        }
        else if([student.name isEqualToString:@"Mark"])
        {
            student.favoriteFood = @"Corned Beef";
            student.favoriteColor = @"Green";
            student.favoriteMusicalArtist = @"Ryan Adams";
            student.favoriteGame = @"Milles Borne";
        }
        else if([student.name isEqualToString:@"Tim"])
        {
            student.favoriteFood = @"Cheesecake";
            student.favoriteColor = @"Blue";
            student.favoriteMusicalArtist = @"Destroyer";
            student.favoriteGame = @"Secret Of Mana";
        }
        else if([student.name isEqualToString:@"Joseph M. Burgess"])
        {
            student.favoriteFood = @"Peanut butter";
            student.favoriteColor = @"Red";
            student.favoriteMusicalArtist = @"Odesza";
            student.favoriteGame = @"Danger / sometimes 'Dots'";
        }
    }
}
@end
