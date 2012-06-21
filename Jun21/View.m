//
//  View.m
//  Jun21
//
//  Created by Matthew Fong on 6/18/12.
//  Copyright (c) 2012 Goldman Sachs. All rights reserved.
//

#import "View.h"


@implementation View

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
- (void) drawRect: (CGRect) rect
{
    // Drawing code
    // Drawing code
    CGRect bounds = self.bounds;
    CGFloat radius = .1 * bounds.size.width;	//in pixels
    CGSize          myShadowOffset = CGSizeMake (-15,  20);
    
    CGColorRef      myColor;
    CGColorSpaceRef myColorSpace;
    CGFloat         myColorValues[] = {1, 0, 0, .6};
    
    myColorSpace = CGColorSpaceCreateDeviceRGB ();
    myColor = CGColorCreate (myColorSpace, myColorValues);

     
    /*
     Create the invisible square that will surround the circle.
     Place the upper left corner of the square at the upper left corner of
     the View.  bounds.origin.x and bounds.origin.y are the coordinates of
     the upper left corner of the View.
     */
    
     CGContextRef c = UIGraphicsGetCurrentContext();
     CGContextSetLineWidth(c, 3.0);
     CGContextBeginPath(c); //unnecessary here: the path is already empty.
     CGContextSetRGBStrokeColor(c, 0.8, 0.84, 0.84, 0.5);	//tiffany engagement ring silver 206,215,214
     CGContextStrokePath(c);

     CGContextSetShadow (c, myShadowOffset, 5); 
     //CGContextSetShadowWithColor (c, myShadowOffset, 5, myColor);
    
     for (int i = 0; i < 5; i++){

        int angle = (i % 2 ==0) ? i : i * -2;
         
        CGContextRotateCTM(c, angle * M_PI / 180);
         
        CGRect r = CGRectMake(
                                    bounds.origin.x + radius*i,
                                    bounds.origin.y + radius*i,
                                    2 * radius,
                                    1.5 * radius
                                    );
        CGContextAddEllipseInRect(c, r);
        CGContextSetRGBStrokeColor(c, 1 - i*0.2, i*0.2, i*0.2, 1);
        CGContextStrokePath(c);
    };

}



@end
