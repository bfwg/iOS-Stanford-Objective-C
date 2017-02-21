//
//  StartingViewController.m
//  Matchismo
//
//  Created by Fan Jin on 2017-02-19.
//  Copyright © 2017 Fan Jin. All rights reserved.
//

#import "StartingViewController.h"
#import "CardGameViewController.h"

@interface StartingViewController ()

@property (nonatomic)NSUInteger cardsToMatch;
@property (weak, nonatomic) IBOutlet UIButton *twoCardsMatchingButton;
@property (weak, nonatomic) IBOutlet UIButton *threeCardsMatchingButton;

@end

@implementation StartingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.twoCardsMatchingButton.tag = 2;
    self.threeCardsMatchingButton.tag = 3;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    CardGameViewController *cardGameView = [segue destinationViewController];
    cardGameView.cardsToMatch = [sender tag];
}

@end
