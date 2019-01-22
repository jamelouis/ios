//
//  ViewController.m
//  OpenGLES
//
//  Created by jamelouis on 2019/1/22.
//  Copyright © 2019 jamelouis. All rights reserved.
//

#import "ViewController.h"
#import "Editbox.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *editboxText;
@property (weak, nonatomic) IBOutlet UIButton *editBoxButton;
- (IBAction)openEditbox:(id)sender;

@end

@implementation ViewController

- (void)EditboxViewDone:(UITextField*)textField
{
    self.editboxText.text = textField.text;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    GLKView *view = (GLKView*)self.view;
    view.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    
    // self.preferredFramesPerSecond = 60;
    
    [self setupGL];
}

-(void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    glClearColor(1.0f, 0.0f, 1.0f, 1.0f);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
}

-(void)setupGL
{
    GLKView *view = (GLKView*)self.view;
    
    view.drawableColorFormat = GLKViewDrawableColorFormatRGBA8888;
    view.drawableDepthFormat = GLKViewDrawableDepthFormat24;
    view.drawableStencilFormat = GLKViewDrawableStencilFormat8;
    view.drawableMultisample = GLKViewDrawableMultisample4X;
}

- (void) openEditBox
{
    CGRect frame = self.view.frame;
    frame.size.height = 50;
    
    EditboxView *editboxView = [[EditboxView alloc] initWithFrame:frame];
    [editboxView setDelegate:self];
    [editboxView setText:self.editboxText.text];
    [self.view addSubview:editboxView];
}
- (IBAction)openEditbox:(id)sender {
    [self openEditBox];
}
@end
