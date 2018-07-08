//
//  ViewController.m
//  VerySimpleAPP
//
//  Created by Белецкий Михаил Александрович on 04.07.18.
//  Copyright © 2018 Белецкий Михаил Александрович. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *loginEditText;
@property (weak, nonatomic) IBOutlet UITextField *passwordEditText;

@property (weak, nonatomic) IBOutlet UILabel *errorLabel;
@property (weak, nonatomic) IBOutlet UIView *authView;
@property (weak, nonatomic) IBOutlet UIButton *goButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _goButton.layer.cornerRadius = 8;
}

- (IBAction)authorize:(id)sender {
    
    if([_loginEditText.text isEqualToString:@"Angel"] && [_passwordEditText.text isEqualToString:@"Demon"])
    {
        
        
        _errorLabel.text = @"успешно..";
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            _errorLabel.hidden = YES;
             [self performSegueWithIdentifier:@"show sins" sender:nil];
        });
       
    }
    else
    {
        _errorLabel.text = @"введите правильные Логин и пароль";
        [self shake_animation:_authView];
        _errorLabel.hidden = NO;
    }
}

-(void) shake_animation: (UIView *) view
{
    CABasicAnimation *animation =
    [CABasicAnimation animationWithKeyPath:@"position"];
    [animation setDuration:0.05];
    [animation setRepeatCount:4];
    [animation setAutoreverses:YES];
    [animation setFromValue:[NSValue valueWithCGPoint:
                             CGPointMake([view center].x - 20.0f, [view center].y)]];
    [animation setToValue:[NSValue valueWithCGPoint:
                           CGPointMake([view center].x + 20.0f, [view center].y)]];
    [[view layer] addAnimation:animation forKey:@"position"];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == _loginEditText) {
        [_passwordEditText becomeFirstResponder];
    }
    else
        [_passwordEditText resignFirstResponder];
    return true;
}
@end
