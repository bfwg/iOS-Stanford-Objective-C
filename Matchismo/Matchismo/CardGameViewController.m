//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Fan Jin on 2017-02-14.
//  Copyright © 2017 Fan Jin. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *filpsLabel;
@property (weak, nonatomic) IBOutlet UIButton *cardButton;
@property (nonatomic) int filpCount;
@property (strong, nonatomic) PlayingCardDeck *deck;

@end


@implementation CardGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.deck = [[PlayingCardDeck alloc] init];
    [self.cardButton setBackgroundImage:[UIImage imageNamed:@"cardback"]
                               forState:UIControlStateNormal];
}

- (void)setFilpCount:(int)filpCount {
    _filpCount = filpCount;
    self.filpsLabel.text = [NSString stringWithFormat:@"Filps: %d", filpCount];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    
    
    if ([sender.currentTitle length] > 0) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                          forState:UIControlStateNormal];
        [sender setTitle:[self.deck drawRandomCard].contents forState:UIControlStateNormal];
    }

    self.filpCount++;

}


@end
