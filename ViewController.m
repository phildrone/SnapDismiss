//
//  ViewController.m
//  SnapDismiss
//
//  Created by Philip Aaronson on 12/10/14.
//  Copyright (c) 2014 Philip Aaronson. All rights reserved.
//

#import "ViewController.h"
#import "ModalViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIButton* presentButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];

    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view.bounds.size.height;
    CGFloat padding = 40.0f;
    CGRect buttonRect = CGRectMake(padding, height - 60.0f, width - 2.0f*padding, 40.0f);
    NSLog(@"button frame = %@",NSStringFromCGRect(buttonRect));
    self.presentButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.presentButton setTitle:@"Present" forState:UIControlStateNormal];
    self.presentButton.frame = buttonRect;
    [self.presentButton addTarget:self action:@selector(presentButtonTouched) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.presentButton];
}

- (void)presentButtonTouched
{
    NSLog(@"presentButtonTouched");
    ModalViewController* modal = [[ModalViewController alloc] init];
    modal.underView = self.view;
    modal.modalPresentationStyle = UIModalPresentationOverFullScreen;
    modal.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:modal animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
