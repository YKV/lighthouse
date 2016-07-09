//
//  ViewController.m
//  FingerPaintMe
//
//  Created by Yevhen Kim on 2016-07-08.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "ViewController.h"
#import "PaintView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentController;
@property (weak, nonatomic) IBOutlet PaintView *paintView;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (IBAction)indexChanged:(UISegmentedControl *)sender {
 
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.paintView.lineColor = [UIColor greenColor];
            break;
        case 1:
            self.paintView.lineColor = [UIColor redColor];
            break;
        case 2:
            self.paintView.lineColor = [UIColor blueColor];
            break;
        case 3:
            self.paintView.lineColor = [UIColor yellowColor];
            break;
        case 4:
            self.paintView.lineColor = [UIColor brownColor];
            break;
            
        default:
            break;
    }
    
    for (int i = 0 ; i < [sender.subviews count]; i++) {
        [[sender.subviews objectAtIndex:i]setBackgroundColor:self.paintView.lineColor];
    }
}


@end
