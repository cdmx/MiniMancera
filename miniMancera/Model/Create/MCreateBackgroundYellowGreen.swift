import UIKit

class MCreateBackgroundYellowGreen:MCreateBackgroundProtocol
{
    func view() -> UIView
    {
        let punkYellow:UIColor = UIColor(
            red:0.9,
            green:0.9,
            blue:0,
            alpha:1)
        
        let gradient:VGradient = VGradient.diagonal(
            colorLeftBottom:punkYellow,
            colorTopRight:UIColor.punkGreen)
        
        return gradient
    }
}
