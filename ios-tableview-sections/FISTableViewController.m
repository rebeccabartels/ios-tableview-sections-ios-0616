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

@end

@implementation FISTableViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    FISStudent *charlemagne  = [[FISStudent alloc] init];
    FISStudent *irene = [[FISStudent alloc] init];
    FISStudent *theodora = [[FISStudent alloc] init];
    FISStudent *vlad = [[FISStudent alloc] init];
    
    charlemagne.name = @"Charlemagne";
    irene.name = @"Irene";
    theodora.name = @"Theodora";
    vlad.name = @"Vlad";
    
    charlemagne.favoriteThings = @[@"Subordinating Europe and the Papacy", @"Raising large armies", @"The Franks"];
    irene.favoriteThings = @[@"Blinding her enemies", @"The Byzantine Crown", @"Being the Queen of Byzantium"];
    theodora.favoriteThings = @[@"Justinian", @"Wine", @"Hagia Sophia"];
    vlad.favoriteThings = @[@"Noses", @"Impaling his enemies", @"House of Dracul"];
    
    self.students = @[charlemagne, irene, theodora, vlad];
    
    
    NSLog(@"The students are: Charlemagne, Theodora, Irene, Vlad");
    NSLog(@"%@'s favorite things are:%@", charlemagne.name, charlemagne.favoriteThings);
    NSLog(@"%@'s favorite things are:%@", irene.name, irene.favoriteThings);
    NSLog(@"%@'s favorite things are:%@", theodora.name, theodora.favoriteThings);
    NSLog(@"%@'s favorite things are:%@", vlad.name, vlad.favoriteThings);
}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
   return (NSInteger)self.students.count;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    FISStudent *currentStudent = self.students[(NSUInteger)section];
    return (NSInteger)currentStudent.favoriteThings.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"expandingCell" forIndexPath:indexPath];
FISStudent *currentStudent = self.students[(NSUInteger)indexPath.section];
    
    NSString *thisFavoriteThing = currentStudent.favoriteThings[(NSUInteger)indexPath.row];
    cell.textLabel.text = thisFavoriteThing;
    cell.detailTextLabel.text = [NSString stringWithFormat: @"%ld", indexPath.row + 1];
    
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


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
