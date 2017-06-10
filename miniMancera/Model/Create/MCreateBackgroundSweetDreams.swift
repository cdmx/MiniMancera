import UIKit

class MCreateBackgroundSweetDreams:MCreateBackgroundProtocol
{
    func view() -> UIView
    {
        let lightBlue:UIColor = UIColor(
            red:0.227450980392157,
            green:0.831372549019608,
            blue:0.925490196078431,
            alpha:1)
        let pinkyRed:UIColor = UIColor(
            red:0.913725490196078,
            green:0.376470588235294,
            blue:0.494117647058824,
            alpha:1)
        
        let gradient:VGradient = VGradient.diagonal(
            colorLeftBottom:lightBlue,
            colorTopRight:pinkyRed)
        
        return gradient
    }
}
