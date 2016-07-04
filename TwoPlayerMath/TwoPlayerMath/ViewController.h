//
//  ViewController.h
//  TwoPlayerMath
//
//  Created by Yevhen Kim on 2016-07-04.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import <UIKit/UIKit.h>


@class Player;
@class GameModel;

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *question;

@property (strong, nonatomic) Player *player;
@property (strong, nonatomic) GameModel *mathQuestion;

@property (strong, nonatomic) IBOutlet UIButton *submitButton;

@property (strong, nonatomic) IBOutlet UIButton *button0;
@property (strong, nonatomic) IBOutlet UIButton *button1;
@property (strong, nonatomic) IBOutlet UIButton *button2;
@property (strong, nonatomic) IBOutlet UIButton *button3;
@property (strong, nonatomic) IBOutlet UIButton *button4;
@property (strong, nonatomic) IBOutlet UIButton *button5;
@property (strong, nonatomic) IBOutlet UIButton *button6;
@property (strong, nonatomic) IBOutlet UIButton *button7;
@property (strong, nonatomic) IBOutlet UIButton *button8;
@property (strong, nonatomic) IBOutlet UIButton *button9;

@end

