import UIKit

class MCreateBackgroundPurpleGreen:MCreateBackgroundProtocol
{
    func view() -> UIView
    {
        let gradient:VGradient = VGradient.diagonal(
            colorLeftBottom:UIColor.punkPurple,
            colorTopRight:UIColor.punkGreen)
        
        return gradient
    }
}
