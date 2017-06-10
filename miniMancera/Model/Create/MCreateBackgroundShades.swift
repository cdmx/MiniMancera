import UIKit

class MCreateBackgroundShades:MCreateBackgroundProtocol
{
    func view() -> UIView
    {
        let colorGrayLight:UIColor = UIColor(white:0.7, alpha:1)
        let colorGrayDark:UIColor = UIColor(white:0.05, alpha:1)
        
        let gradient:VGradient = VGradient.diagonal(
            colorLeftBottom:colorGrayLight,
            colorTopRight:colorGrayDark)
        
        return gradient
    }
}
