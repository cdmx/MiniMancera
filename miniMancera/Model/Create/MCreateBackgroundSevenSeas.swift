import UIKit

class MCreateBackgroundSevenSeas:MCreateBackgroundProtocol
{
    func view() -> UIView
    {
        let seaGreen:UIColor = UIColor(
            red:0.294117647058824,
            green:0.749019607843137,
            blue:0.745098039215686,
            alpha:1)
        
        let gradient:VGradient = VGradient.diagonal(
            colorLeftBottom:seaGreen,
            colorTopRight:UIColor.punkPurple)
        
        return gradient
    }
}
