#import "UIColor+EasyGradients.h"

@implementation UIColor (EasyGradients)

-(CGGradientRef)newGradientToColor:(UIColor*)color
{
    // Caller is responsible for releasing
    
    // Are we in the RGB colour space?
    BOOL selfOK,colorOK;
    
    CGFloat r1,r2,g1,g2,b1,b2,a1,a2;
    
    selfOK = [self getRed:&r1 green:&g1 blue:&b1 alpha:&a1];
    colorOK = [color getRed:&r2 green:&g2 blue:&b2 alpha:&a2];
    
    if (selfOK && colorOK)
    {
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        size_t num_locations = 2;
        CGFloat locations[2] = {0.0,1.0};
        CGFloat components[8] = { r1,g1,b1,a1, r2,g2,b2,a2 };
        
        CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, components, locations, num_locations);
        CGColorSpaceRelease(colorSpace);
        return gradient;
    }
    
    // Try grayscale
    CGFloat w1,w2;
    selfOK = [self getWhite:&w1 alpha:&a1];
    colorOK = [color getWhite:&w2 alpha:&a2];
    if (selfOK && colorOK)
    {
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
        size_t num_locations = 2;
        CGFloat locations[2] = {0.0,1.0};
        CGFloat components[4] = { w1,a1, w2,a2 };
        
        CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, components, locations, num_locations);
        CGColorSpaceRelease(colorSpace);
        return gradient;
    }
    
    // otherwise, we can't do anything
    NSAssert(NO,@"Colors must be in RGB or Grayscale color space");
    return NULL;
}


@end
