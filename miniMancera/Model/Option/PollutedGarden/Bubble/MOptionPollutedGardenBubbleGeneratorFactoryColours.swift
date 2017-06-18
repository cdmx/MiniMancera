import UIKit

extension MOptionPollutedGardenBubbleGenerator
{
    class func factoryColours() -> [UIColor]
    {
        let colourSuccess:UIColor = UIColor.colourSuccess
        let colourFail:UIColor = UIColor.colourFail
        let colourRed:UIColor = UIColor(
            red:1,
            green:0.2,
            blue:0,
            alpha:1)
        
        let colours:[UIColor] = [
            colourSuccess,
            colourFail,
            colourRed]
        
        return colours
    }
}
