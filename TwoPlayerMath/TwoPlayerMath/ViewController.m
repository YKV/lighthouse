//
//  ViewController.m
//  TwoPlayerMath
//
//  Created by Yevhen Kim on 2016-07-04.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "ViewController.h"
#import "Player.h"
#import "GameModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //initialize game model and player
    self.gameModel = [[GameModel alloc]init];
    Player *player = [[Player alloc]init];
    
    //get randomly generated x and y for math question
    NSInteger x = [self.gameModel generateNumber];
    NSInteger y = [self.gameModel generateNumber];
    //get the random player
    NSInteger gamePlayer = [player randomPlayer];
    
    //format the question
    self.question.text = [NSString stringWithFormat:@"Player %ld: %ld + %ld",gamePlayer,x,y];
    //call calculation method
    NSInteger answer = [self.gameModel calculator:x y:y];
    NSLog(@"%ld", answer);
N
    
    // create an array of UIButtons
    NSArray *arrButtons = [[NSArray alloc]initWithObjects:
                                                            self.button0,
                                                            self.button1,
                                                            self.button2,
                                                            self.button3,
                                                            self.button4,
                                                            self.button5,
                                                            self.button6,
                                                            self.button7,
                                                            self.button8,
                                                            self.button9, nil];
    //set a title for every button from game model default initialized buttonsArray
    for (int i = 0 ; i < [arrButtons count]; i++) {
        UIButton *button = arrButtons[i];
        [button setTitle: self.gameModel.buttonsArray[i] forState:UIControlStateNormal];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)button0:(id)sender {
    
    
}

- (IBAction)button1:(id)sender {
    
}

- (IBAction)button2:(id)sender {
    
}

- (IBAction)button3:(id)sender {
    
}

- (IBAction)button4:(id)sender {
    
}

- (IBAction)button5:(id)sender {
    
}

- (IBAction)button6:(id)sender {
    
}

- (IBAction)button7:(id)sender {
    
}

- (IBAction)button8:(id)sender {
    
}

- (IBAction)button9:(id)sender {
    
}

- (IBAction)submitAnswer:(id)sender {
    
}

@end
