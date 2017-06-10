import UIKit

class MCreateBackgroundBlueNight:MCreateBackgroundProtocol
{
    func view() -> UIView
    {
        let lightBlue:UIColor = UIColor(
            red:0.227450980392157,
            green:0.831372549019608,
            blue:0.925490196078431,
            alpha:1)
        let colorGrayDark:UIColor = UIColor(white:0.05, alpha:1)
        
        let gradient:VGradient = VGradient.diagonal(
            colorLeftBottom:lightBlue,
            colorTopRight:colorGrayDark)
        
        return gradient
    }
}
