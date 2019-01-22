//
//  Editbox.h
//  OpenGLES
//
//  Created by jamelouis on 2019/1/22.
//  Copyright © 2019 jamelouis. All rights reserved.
//

#ifndef Editbox_h
#define Editbox_h

@protocol EditboxViewDelegate <NSObject>

- (void)EditboxViewDone:(UITextField*)textField;

@end

@interface EditboxView : UIView <UITextFieldDelegate>

- (void)setDelegate:(id)delegate;
- (void)setText:(NSString*)text;

@end

#endif /* Editbox_h */
