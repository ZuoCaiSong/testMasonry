//
//  MASExampleLabelView.m
//  Masonry iOS Examples
//
//  Created by Jonas Budelmann on 24/10/13.
//  Copyright (c) 2013 Jonas Budelmann. All rights reserved.
//

#import "MASExampleLabelView.h"

static UIEdgeInsets const kPadding = {10, 10, 10, 10};

@interface MASExampleLabelView ()

@property (nonatomic, strong) UILabel *shortLabel;
@property (nonatomic, strong) UILabel *longLabel;

@end

@implementation MASExampleLabelView

- (id)init {
    self = [super init];
    if (!self) return nil;
    
    // text courtesy of http://baconipsum.com/
    
    self.shortLabel = UILabel.new;
    self.shortLabel.numberOfLines = 1;
    self.shortLabel.textColor = [UIColor purpleColor];
    //结尾部分的内容以……方式省略，显示头的
    self.shortLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    self.shortLabel.text = @"Bacon";
    [self addSubview:self.shortLabel];
    
    self.longLabel = UILabel.new;
    self.longLabel.numberOfLines = 8;
    self.longLabel.textColor = [UIColor darkGrayColor];
    self.longLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    self.longLabel.text = @"Bacon ipsum dolor sit amet spare ribs fatback kielbasa salami, tri-tip jowl pastrami flank short loin rump sirloin. Tenderloin frankfurter chicken biltong rump chuck filet mignon pork t-bone flank ham hock.";
    [self addSubview:self.longLabel];
    
    [self.longLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).insets(kPadding);
        make.top.equalTo(self.mas_top).insets(kPadding);
    }];
    
    [self.shortLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.longLabel.mas_lastBaseline);
        make.right.equalTo(self.mas_right).insets(kPadding);
    }];
    
    return self;
}

/*
 The preferred maximum width (in points) for a multiline label.
 This property affects the size of the label when layout constraints are applied to it. During layout, if the text extends beyond the width specified by this property, the additional text is flowed to one or more new lines, thereby increasing the height of the label
 
 多行标签的首选最大宽度（以磅为单位）。
 当应用布局约束时，此属性会影响标签的大小。 在布局期间，如果文本扩展超出此属性指定的宽度，则附加文本将流向一个或多个新行，从而增加标签的高度
 */

// 在layoutSubviews中确认label的preferredMaxLayoutWidth值
- (void)layoutSubviews {
    [super layoutSubviews];
    
    // for multiline UILabel's you need set the preferredMaxLayoutWidth
    // you need to do this after [super layoutSubviews] as the frames will have a value from Auto Layout at this point
    
    // stay tuned for new easier way todo this coming soon to Masonry
    
    // 你必须在 [super layoutSubviews] 调用之后，longLabel的frame有值之后设置preferredMaxLayoutWidth
    CGFloat width = CGRectGetMinX(self.shortLabel.frame) - kPadding.left;
    width -= CGRectGetMinX(self.longLabel.frame);
    self.longLabel.preferredMaxLayoutWidth = width;
    
    // need to layoutSubviews again as frames need to recalculated with preferredLayoutWidth
    // 设置preferredLayoutWidth后，需要重新布局
    [super layoutSubviews];
}

@end
