//
//  ModalViewController.m
//  SnapDismiss
//
//  Created by Philip Aaronson on 12/10/14.
//  Copyright (c) 2014 Philip Aaronson. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()
@property (nonatomic, strong) UIVisualEffectView* blurView;
@property (nonatomic, strong) UIButton* dismissButton;
@property (nonatomic, strong) UIImageView* sceneryView;
@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view.bounds.size.height;
    CGFloat padding = 40.0f;

    self.blurView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    self.blurView.frame = self.view.bounds;
    [self.view addSubview:self.blurView];
    
    CGRect buttonRect = CGRectMake(padding, height - 60.0f, width - 2.0f*padding, 40.0f);
    self.dismissButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.dismissButton setTitle:@"Dismiss" forState:UIControlStateNormal];
    self.dismissButton.frame = buttonRect;
    [self.dismissButton addTarget:self action:@selector(dismissButtonTouched) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.dismissButton];
}

- (void)dismissButtonTouched
{
    UIGraphicsBeginImageContextWithOptions(self.underView.bounds.size, self.underView.opaque, 0.0);
    //[self.underView.layer renderInContext:UIGraphicsGetCurrentContext()];
    [self.underView drawViewHierarchyInRect:self.underView.bounds afterScreenUpdates:NO];
    UIImage *transitionImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.sceneryView =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.sceneryView.image = transitionImage;
    [self.view addSubview:self.sceneryView];
    [self.view sendSubviewToBack:self.sceneryView];
    
    self.underView.backgroundColor = [UIColor yellowColor];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
