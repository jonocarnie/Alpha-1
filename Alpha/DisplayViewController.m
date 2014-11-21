//
//  ViewController.m
//  Alpha
//
//  Created by Jonathan Carnie on 28/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DisplayViewController.h"

@interface DisplayViewController ()



@end

@implementation DisplayViewController
//@synthesize charToShow;

@synthesize storedNumbers;
@synthesize storedLetters;
@synthesize storedWords;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *errorDesc = nil;
    NSPropertyListFormat format;
    
    
    
    NSString *numPlistPath;
    numPlistPath = [[NSBundle mainBundle] pathForResource:@"Numbers" ofType:@"plist"];

    NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:numPlistPath];
    NSDictionary *numTemp = (NSDictionary *)[NSPropertyListSerialization propertyListFromData:plistXML mutabilityOption:NSPropertyListMutableContainersAndLeaves format:&format errorDescription:&errorDesc];
    
    if (!numTemp) {
        NSLog(@"Error reading plist: %@, format: %d", errorDesc, format);
    }
    
    self.storedNumbers = [NSMutableArray arrayWithArray:[numTemp objectForKey:@"Numbers"]];
    
    
    
    
    NSString *letterPlistPath;
    letterPlistPath = [[NSBundle mainBundle] pathForResource:@"Letters" ofType:@"plist"];
     
    NSData *letterlistXML = [[NSFileManager defaultManager] contentsAtPath:letterPlistPath];
    NSDictionary *letterTmp = (NSDictionary *)[NSPropertyListSerialization propertyListFromData:letterlistXML mutabilityOption:NSPropertyListMutableContainersAndLeaves format:&format errorDescription:&errorDesc];
    
    if (!letterTmp) {
        NSLog(@"Error reading letter plist file: %@, format: %d", errorDesc, format);
    }
    
    self.storedLetters = [NSMutableArray arrayWithArray:[letterTmp objectForKey:@"Letters"]];
  
    
    
    NSString *wordsPlistPath;
    wordsPlistPath = [[NSBundle mainBundle] pathForResource:@"Words" ofType:@"plist"];
    
    NSData *wordListXML = [[NSFileManager defaultManager] contentsAtPath:wordsPlistPath];
    NSDictionary *wordTemp = (NSDictionary *)[NSPropertyListSerialization propertyListFromData:wordListXML mutabilityOption:NSPropertyListMutableContainersAndLeaves format:&format errorDescription:&errorDesc];
    
    if (!wordTemp) {
        NSLog(@"Error reading word plist file: %@, format: %d", errorDesc, format);
    }
 
    self.storedWords = [NSMutableArray arrayWithArray:[wordTemp objectForKey:@"Words"]];
    
    
    
}
#pragma mark - warning - Release the arrays here fella. 
- (void)viewDidUnload
{
//    [self setCharToShow:nil];
    [self setDisplayOutput:nil];
    [super viewDidUnload];
    
    self.storedWords = nil;
    self.storedNumbers = nil;
    self.storedLetters = nil;
    //numPlistPath = nil;
    //self.letterPlistPath = nil;
    //self.wordsPlistPath = nil;
   
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (IBAction)displayLetter:(id)sender {
    int randomNum = arc4random() % [self.storedLetters count];
   
    self.displayOutput.text = [self.storedLetters objectAtIndex:randomNum];
    
    
}
- (IBAction)numToShow:(id)sender {
    int randomNum = arc4random() % [self.storedNumbers count];
    
    self.displayOutput.text = [self.storedNumbers objectAtIndex:randomNum];
    
}

- (IBAction)displayWord:(id)sender{
    int randomNum = arc4random() % [self.storedWords count];
    self.displayOutput.text = [self.storedWords objectAtIndex:randomNum];
}



@end
