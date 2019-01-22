//
//  Editbox.m
//  OpenGLES
//
//  Created by jamelouis on 2019/1/22.
//  Copyright © 2019 jamelouis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#include "Editbox.h"



@interface EditboxView ()

@property (strong, nonatomic) UITextField* _textField;
@property (strong, nonatomic) UIButton* _doneButton;
@property (strong, nonatomic) UIButton* _cancelButton;
@property (weak, nonatomic)   id <EditboxViewDelegate> _delegate;

@end

@implementation EditboxView

- (void)setDelegate:(id)delegate
{
    self._delegate = delegate;
}

- (void)setText:(NSString*)text
{
    self._textField.text = text;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor lightGrayColor];
    self.alpha = 0.98;
    if (self)
    {
        CGRect contentFrame = frame;
        contentFrame.origin.x += 8;
        contentFrame.origin.y += 8;
        contentFrame.size.width -= 16;
        contentFrame.size.height -= 16;
        [self customInit:contentFrame];
    }
    return self;
}

- (void)customInit:(CGRect)frame
{
    CGRect textFrame = frame;
    textFrame.size.width = 0.8 * textFrame.size.width;
    
    self._textField = [[UITextField alloc] initWithFrame:textFrame];
    self._textField.placeholder = @"Hello,Editbox";
    self._textField.backgroundColor = [UIColor whiteColor];
    [self._textField becomeFirstResponder];
    [self addSubview:self._textField];
    
    CGRect doneButtonFrame = frame;
    doneButtonFrame.origin.x = textFrame.origin.x + textFrame.size.width + 8;
    doneButtonFrame.size.width = 0.1 * textFrame.size.width;
    self._doneButton = [[UIButton alloc] initWithFrame:doneButtonFrame];
    self._doneButton.backgroundColor = [UIColor whiteColor];
    [self._doneButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self._doneButton setTitle:@"确认" forState:UIControlStateNormal];
    [self._doneButton addTarget:self action:@selector(done) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self._doneButton];
    
    CGRect cancelButtonFrame = frame;
    cancelButtonFrame.origin.x = doneButtonFrame.origin.x + doneButtonFrame.size.width + 8;
    cancelButtonFrame.size.width = 0.1 * textFrame.size.width;
    self._cancelButton = [[UIButton alloc] initWithFrame:cancelButtonFrame];
    self._cancelButton.backgroundColor = [UIColor whiteColor];
    [self._cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self._cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [self._cancelButton addTarget:self action:@selector(cancle) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self._cancelButton];
}

-(void)done
{
    [self._delegate EditboxViewDone: self._textField];
    [self._textField resignFirstResponder];
    [self removeFromSuperview];
}

-(void)cancle
{
    [self._textField resignFirstResponder];
    [self removeFromSuperview];
}

@end
