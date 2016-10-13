//
//  View.m
//  mvcTest
//
//  Created by sheng on 2016/10/11.
//  Copyright © 2016年 sheng. All rights reserved.
//

#import "View.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
@implementation View

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        CGFloat marginH = 25;
        CGFloat marginV = 25;
        
        
        self.header = [[UIImageView alloc] initWithFrame:CGRectMake(marginH, marginV, 50, 50)];
        [self.contentView addSubview:self.header];
        
        self.name = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxY(self.header.frame) +20, marginV, kScreenWidth - CGRectGetMaxX(self.header.frame) - 20, 20)];
        [self.contentView addSubview:self.name];
        self.name.textColor = [UIColor blackColor];
        self.name.textAlignment = NSTextAlignmentLeft;
        
        self.content = [[UILabel alloc] initWithFrame:CGRectMake(self.name.frame.origin.x, CGRectGetMaxY(self.name.frame) + 10, self.name.frame.size.width, 100 - CGRectGetMaxY(self.name.frame) - 10)];
        [self.contentView addSubview:self.content];
        self.content.textAlignment = NSTextAlignmentLeft;
        self.content.textColor = [UIColor blackColor];
        self.content.numberOfLines = 0;
        
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
