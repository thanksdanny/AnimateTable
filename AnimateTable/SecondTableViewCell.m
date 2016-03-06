//
//  SecondTableViewCell.m
//  AnimateTable
//
//  Created by Danny Ho on 3/7/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "SecondTableViewCell.h"

@interface SecondTableViewCell ()

@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@end

@implementation SecondTableViewCell

// lazy
- (CAGradientLayer *)gradientLayer {
    if (!_gradientLayer) {
        _gradientLayer = [CAGradientLayer layer]; // 之前一直没出现效果，是因为写了property但没有初始化
    }
    return _gradientLayer;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.gradientLayer.frame = self.bounds;
        
        self.gradientLayer.colors = @[(__bridge id)[UIColor colorWithWhite:1.0 alpha:0.2].CGColor,
                                      (__bridge id)[UIColor colorWithWhite:1.0 alpha:0.1].CGColor,
                                      (__bridge id)[UIColor clearColor].CGColor,
                                      (__bridge id)[UIColor colorWithWhite:0.0 alpha:0.05].CGColor];
        self.gradientLayer.locations = @[@(0.0), @(0.04), @(0.95), @(1.0)];
        
        [self.layer insertSublayer:self.gradientLayer atIndex:0];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.gradientLayer.frame = self.bounds;
}



- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selencted state
}

@end
