UIColor-EasyGradients
=====================

Category on UIColor for creating a CGGradient from the receiver to a new colour. 

Example usage: 

    CGGradientRef gradient = [[UIColor redColor] newGradientToColor:[UIColor greenColor]];

The caller is responsible for releasing the gradient ref object. A full description of the category can be found [on my blog](http://commandshift.co.uk/blog/2012/11/25/easy-cggradients/)
