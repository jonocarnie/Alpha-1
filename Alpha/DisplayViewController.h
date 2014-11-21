//
//  ViewController.h
//  Alpha
//
//  Created by Jonathan Carnie on 28/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DisplayViewController : UIViewController{
//    NSMutableArray *storedNumbers;
//    NSMutableArray *storedLetters;
//    NSMutableArray *storedWords;
}

- (IBAction)displayLetter:(id)sender;
- (IBAction)numToShow:(id)sender;
- (IBAction)displayWord:(id)sender;

//@property (strong, nonatomic) IBOutlet UITextView *charToShow;

@property (weak, nonatomic) IBOutlet UILabel *displayOutput;

@property (strong, nonatomic) NSMutableArray *storedNumbers;
@property (strong, nonatomic) NSMutableArray *storedLetters;
@property (strong, nonatomic) NSMutableArray *storedWords;


@end
