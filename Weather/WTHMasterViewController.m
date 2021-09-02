//
//  WTHMasterViewController.m
//  Weather
//
//  Created by Steven on 13-12-3.
//  Copyright (c) 2013年 Steven. All rights reserved.
//

#import "WTHMasterViewController.h"
#import "WTHDetailViewController.h"
#import "WTHCityArray.h"
#import "WTHCity.h"
#import "WTHAppDelegate.h"

@interface WTHMasterViewController ()
{
  //  NSMutableArray *_objects;
    WTHCityArray* _cityArray;
}
@end

@implementation WTHMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    self.navigationItem.leftBarButtonItem = self.editButtonItem;
//
//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
//    self.navigationItem.rightBarButtonItem = addButton;
    UIRefreshControl* refreshcontrol=[[UIRefreshControl alloc] init];
    self.refreshControl=refreshcontrol;
    [refreshcontrol addTarget:self  action:@selector(refreshAll:) forControlEvents:UIControlEventValueChanged];
    
    _cityArray =[[WTHCityArray alloc] init];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(valueChanged:) name:@"ValueChanged" object:_cityArray];
}
- (IBAction)addButton:(id)sender {
    UIAlertView *alart=[[UIAlertView alloc]
                        initWithTitle:@"Add City" message:@"Enter City Name:"delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Accept", nil
                        ];
    alart.alertViewStyle=UIAlertViewStylePlainTextInput;
    [alart show];
    
}
-(void)refreshAll:(id)sender
{
    [_cityArray refreshAll];
    [self.refreshControl endRefreshing];
}

-(void)alertView:(UIAlertView*) alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0)
    {
        
    }
    else if(buttonIndex==1)
    {
        NSString* cityName = [[alertView textFieldAtIndex:0].text uppercaseString];
        
        WTHAppDelegate* delegate=(WTHAppDelegate*) [[UIApplication sharedApplication] delegate];
        NSDictionary* cityInfo=[delegate findCityName:cityName];
        [_cityArray addCity:cityInfo];
        
     //   NSDictionary* cityInfo=@{@"CityCode":@"101030100",@"chnName":@"天津"};
       // [_cityArray addCity:cityInfo];
    }
    else
    {
        
    }
}


-(void)valueChanged:(NSNotification*)notification
{
    NSDictionary* useinfo=notification.userInfo;
    NSArray* indexes= useinfo[@"keyIndexes"];
    NSArray* indexPaths=[self indexPathsFromIndexes:indexes];
    
  //  NSMutableArray * indexPathArray=[NSMutableArray array];
    if ([useinfo[@"keyType"] isEqualToString:@"INSERTION"]==YES)
    {
      
        [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    else if([useinfo[@"keyType"] isEqualToString:@"DELETION"]==YES)
    {
        [self.tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    else if([useinfo[@"keyType"] isEqualToString:@"UPDATE"]==YES)
    {
        [self.tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

-(NSArray*) indexPathsFromIndexes:(NSArray*)indexes
{
    NSMutableArray* indexPathArray=[NSMutableArray array];
    for (NSNumber* rowIndex in indexes) {
        NSIndexPath* indexPath=[NSIndexPath indexPathForRow:[rowIndex integerValue] inSection:0];
        [indexPathArray addObject:indexPath];
    }
    return indexPathArray;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_cityArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    UIImageView * imageview=(UIImageView *)[cell viewWithTag:11];
    UILabel* nameLabel=(UILabel*)[cell viewWithTag:12];
    UILabel* tempLabel=(UILabel*)[cell viewWithTag:13];
    
    WTHCity * city= _cityArray[indexPath.row];
    
    imageview.image=[UIImage imageNamed:city.imageName];
    nameLabel.text=city.name;
    tempLabel.text=city.temp;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
   
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        
        [_cityArray removeObjectAtIndex:indexPath.row];
    }
}

//-(void)removeObjectAtIndex:(NSUInteger)index
//{
//    [_cityArray removeObjectAtIndex:index];
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"ValueChanged" object:self userInfo:@{@"keyType":@"DELETION",@"keyIndexes":@[@(index)]       }];
//}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        
        NSIndexPath* indexPath=[self.tableView indexPathForSelectedRow];
        WTHCity *city=_cityArray[indexPath.row];
        WTHDetailViewController* detailview=(WTHDetailViewController*)[segue destinationViewController];
        detailview.city=city;
        
    }
}

@end
