//
//  FirstViewController.m
//  CMUTicTacToeApp
//
//  Created by Jack Kasbeer on 5/13/13.
//  Copyright (c) 2013 Jack Kasbeer. All rights reserved.
//

#import "FirstViewController.h"

@implementation FirstViewController

@synthesize s1,s2,s3,s4,s5,s6,s7,s8,s9;
@synthesize oImg,xImg,theImg,blankImg,whoseTurn,board;
@synthesize resetButton, myAlertView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initalization
    }
    return self;
}

- (void)viewDidLoad {
    self.oImg = [UIImage imageNamed:@"O.png"];
    self.xImg = [UIImage imageNamed:@"X.png"];
    
    s1.image = NULL;
    s2.image = NULL;
    s3.image = NULL;
    s4.image = NULL;
    s5.image = NULL;
    s6.image = NULL;
    s7.image = NULL;
    s8.image = NULL;
    s9.image = NULL;
    
    
    playerToken = 1;
    
    whoseTurn.text = @"X's Turn!";
    
    numberOfPlays = 0;
    
    
    [super viewDidLoad];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    switch(playerToken){
        case 1:theImg = xImg;
            break;
        case 2:
            theImg = oImg;
            break;
    }
    
    UITouch *touch = [[event allTouches]anyObject];
    cellWasUsed = NO;
    
    if (CGRectContainsPoint([s1 frame], [touch locationInView:self.view])&(s1.image == NULL)) {
        cellWasUsed = YES;
        s1.image = theImg;
    }
    if (CGRectContainsPoint([s2 frame], [touch locationInView:self.view])&(s2.image == NULL)) {
        cellWasUsed = YES;
        s2.image = theImg;
    }
    if (CGRectContainsPoint([s3 frame], [touch locationInView:self.view])&(s3.image == NULL)) {
        cellWasUsed = YES;
        s3.image = theImg;
    }
    if (CGRectContainsPoint([s4 frame], [touch locationInView:self.view])&(s4.image == NULL)) {
        cellWasUsed = YES;
        s4.image = theImg;
    }
    if (CGRectContainsPoint([s5 frame], [touch locationInView:self.view])&(s5.image == NULL)) {
        cellWasUsed = YES;
        s5.image = theImg;
    }
    if (CGRectContainsPoint([s6 frame], [touch locationInView:self.view])&(s6.image == NULL)) {
        cellWasUsed = YES;
        s6.image = theImg;
    }
    if (CGRectContainsPoint([s7 frame], [touch locationInView:self.view])&(s7.image == NULL)) {
        cellWasUsed = YES;
        s7.image = theImg;
    }
    if (CGRectContainsPoint([s8 frame], [touch locationInView:self.view])&(s8.image == NULL)) {
        cellWasUsed = YES;
        s8.image = theImg;
    }
    if (CGRectContainsPoint([s9 frame], [touch locationInView:self.view])&(s9.image == NULL)) {
        cellWasUsed = YES;
        s9.image = theImg;
    }
    [self processLogic];
    if (cellWasUsed) {
        [self updatePlayerInfo];
    }
}

-(void)processLogic{
    
    if ([self checkForWin]){
        if(playerToken == 1){
            myAlertView = [[UIAlertView alloc] initWithTitle:@"Winner" message:@"X Wins!\nPress 'Reset' to play again." delegate:self
                                           cancelButtonTitle:@"Okay" otherButtonTitles: nil, nil];
            [myAlertView show];
        }
        else if(playerToken == 2){
            myAlertView = [[UIAlertView alloc] initWithTitle:@"Winner" message:@"O Wins!\nPress 'Reset' to play again." delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
            [myAlertView show];
        }
        if(numberOfPlays == 9){
            myAlertView = [[ UIAlertView alloc]initWithTitle:@"No Winner" message:@"Tie" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
            [myAlertView show];
        }
        
        [self displayWinner];
    }
}

-(BOOL)checkForWin{
    
    // HORIZONTAL WINS
    if((s1.image == s2.image) & (s2.image == s3.image) & (s1.image != NULL)){
        
        return YES;
    }
    if((s4.image == s5.image) & (s5.image == s6.image) & (s4.image != NULL)){
        
        return YES;
    }
    if((s7.image == s8.image) & (s8.image == s9.image) & (s7.image != NULL)){
        
        return YES;
    }
    // VERTICAL WINS
    if((s1.image == s4.image) & (s4.image == s7.image) & (s1.image != NULL)){
        
        return YES;
    }
    if((s2.image == s5.image) & (s5.image == s8.image) & (s2.image != NULL)){
        
        return YES;
    }
    if((s3.image == s6.image) & (s6.image == s9.image) & (s3.image != NULL)){
        
        return YES;
    }
    // DIAGONAL WINS
    if((s1.image == s5.image) & (s5.image == s9.image) & (s1.image != NULL)){
        
        return YES;
    }
    if((s3.image == s5.image) & (s5.image == s7.image) & (s3.image != NULL)){
        
        return YES;
    }
    
    return NO;
}

-(void)displayWinner{
    if([self checkForWin]== YES){
        if(playerToken == 1){
            whoseTurn.text = @"X wins!";
            
        }
        else{whoseTurn.text = @"O Wins!";
            
        }
    }
}

-(IBAction)buttonReset{
    
    [self resetBoard];
    
}

-(void)resetBoard{
    
    s1.image = NULL;
    s2.image = NULL;
    s3.image = NULL;
    s4.image = NULL;
    s5.image = NULL;
    s6.image = NULL;
    s7.image = NULL;
    s8.image = NULL;
    s9.image = NULL;
    
    playerToken = 1;
    whoseTurn.text = @"X's Turn!";
    
    numberOfPlays = 0;
}

-(void)updatePlayerInfo{
    numberOfPlays++;
    if(numberOfPlays == 9){
        
        [self resetBoard];
    }
    if (playerToken == 1){
        
        playerToken = 2;
        whoseTurn.text = @"O's Turn!";
        
    } else {
        playerToken = 1;
        whoseTurn.text = @"X's Turn!";
    }
}

- (void)dealloc {
    [s1 release];
    [s2 release];
    [s3 release];
    [s4 release];
    [s5 release];
    [s6 release];
    [s7 release];
    [s8 release];
    [s9 release];
    [theImg release];
    [resetButton release];
    [board release];
    [oImg release];
    [xImg release];
    [whoseTurn release];
    [myAlertView release];

    
    [super dealloc];
    
    
}

@end