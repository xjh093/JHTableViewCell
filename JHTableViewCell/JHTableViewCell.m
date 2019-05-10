//
//  JHTableViewCell.m
//  JHKit
//
//  Created by HaoCold on 16/8/12.
//  Copyright © 2016年 HaoCold. All rights reserved.
//
//  MIT License
//
//  Copyright (c) 2017 xjh093
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

#import "JHTableViewCell.h"

static NSString *JHTableViewCellID = nil;

@implementation JHTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    NSString *classStr = NSStringFromClass(self);
    
    JHTableViewCellID = [NSString stringWithFormat:@"%@ID",classStr];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:JHTableViewCellID];
    if (cell == nil) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:JHTableViewCellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    /**< Incompatible pointer types returning */
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincompatible-pointer-types"
    return cell;
#pragma clang diagnostic pop
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self jhSetupViews];
    }
    return self;
}

- (void)jhSetupViews{}

- (UIView *)jhSetupView:(CGRect)frame bgColor:(UIColor *)bgColor
{
    UIView *view = [[UIView alloc] init];
    view.frame = frame;
    view.backgroundColor = bgColor;
    [self.contentView addSubview:view];
    return view;
}

- (UIImageView *)jhSetupImageView:(CGRect)frame
{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = frame;
    [self.contentView addSubview:imageView];
    return imageView;
}

- (UILabel *)jhSetupLabel:(CGRect)frame title:(NSString *)title color:(UIColor *)color font:(CGFloat)font
{
    UILabel *label = [[UILabel alloc] init];
    label.frame = frame;
    label.text = title;
    label.textColor = color;
    label.font = [UIFont systemFontOfSize:font];
    [self.contentView addSubview:label];
    return label;
}

- (UIButton *)jhSetupButton:(CGRect)frame title:(NSString *)title color:(UIColor *)color font:(CGFloat)font
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    [self.contentView addSubview:button];
    return button;
}

@end
