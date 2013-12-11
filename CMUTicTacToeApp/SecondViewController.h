//
//  SecondViewController.h
//  CMUTicTacToeApp
//
//  Created by Jack Kasbeer on 5/15/13.
//  Copyright (c) 2013 Jack Kasbeer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController {
	//the image of the X or O
	IBOutlet UIImage * oImg;
	IBOutlet UIImage * xImg;
    IBOutlet UIImage * theImg;
    IBOutlet UIImage * blankImg;
	
	//these are the UIImageViews that will hold the X or O
	//the 's' stands for Slot
	IBOutlet UIImageView *s1;
	IBOutlet UIImageView *s2;
	IBOutlet UIImageView *s3;
	IBOutlet UIImageView *s4;
	IBOutlet UIImageView *s5;
	IBOutlet UIImageView *s6;
	IBOutlet UIImageView *s7;
	IBOutlet UIImageView *s8;
	IBOutlet UIImageView *s9;
	
	//button to manually reset the game
	IBOutlet UIButton *resetButton;
	
	//Image view that will hold the # pattern
	IBOutlet UIImageView * board;
	
	//label to let the player know who can go or let player know who wins
	IBOutlet UILabel * whoseTurn;
	
	//integer that represents the player
	NSInteger playerToken;
    
    //integer that represents number of turns
    NSInteger numberOfPlays;
    
    //boolean to signify used buttons
    BOOL cellWasUsed;
    
    IBOutlet UIAlertView *myAlterView;
}

@property (nonatomic,retain) UIImage *oImg;
@property (nonatomic,retain) UIImage *xImg;
@property (nonatomic,retain) UIImage *theImg;
@property (nonatomic,retain) UIImage *blankImg;

@property (nonatomic,retain) UIButton *resetButton;

@property (nonatomic,retain) UIImageView *board;

@property (nonatomic,retain) UIAlertView *myAlertView;

@property (nonatomic,retain) UIImageView *s1;
@property (nonatomic,retain) UIImageView *s2;
@property (nonatomic,retain) UIImageView *s3;
@property (nonatomic,retain) UIImageView *s4;
@property (nonatomic,retain) UIImageView *s5;
@property (nonatomic,retain) UIImageView *s6;
@property (nonatomic,retain) UIImageView *s7;
@property (nonatomic,retain) UIImageView *s8;
@property (nonatomic,retain) UIImageView *s9;


@property (nonatomic,retain) UILabel * whoseTurn;

//method to handle button pressing and determining a winner
-(void) processLogic;

//method that will change the player and update the label and place the X or O on the board
-(void) updatePlayerInfo;

//method that will check to see if someone has won returns TRUE if someone wins
-(BOOL) checkForWin;

//button reset
-(IBAction)buttonReset;

//this will reset the game, by clearing the board and reseting the playerTurn to 1
-(void) resetBoard;

@end