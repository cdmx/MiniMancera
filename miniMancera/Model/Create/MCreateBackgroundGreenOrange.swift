import UIKit

class MCreateBackgroundGreenOrange:MCreateBackgroundProtocol
{
    func view() -> UIView
    {
        let gradient:VGradient = VGradient.diagonal(
            colorLeftBottom:UIColor.punkGreen,
            colorTopRight:UIColor.punkOrange)
        
        return gradient
    }
}
