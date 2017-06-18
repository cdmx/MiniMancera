import UIKit

extension MOptionPollutedGardenBubbleGenerator
{
    class func factoryColours() -> [UIColor]
    {
        let colourSuccess:UIColor = UIColor.colourSuccess
        let colourFail:UIColor = UIColor.colourFail
        let colourRed:UIColor = UIColor(
            red:1,
            green:0,
            blue:0,
            alpha:1)
        let colourGreen:UIColor = UIColor(
            red:0.85,
            green:1,
            blue:0,
            alpha:1)
        let colourGreenDark:UIColor = UIColor(
            red:0.7,
            green:1,
            blue:0,
            alpha:1)
        let colourYellow:UIColor = UIColor(
            red:1,
            green:0.95,
            blue:0,
            alpha:1)
        let colourBlue:UIColor = UIColor(
            red:0.65,
            green:0.85,
            blue:1,
            alpha:1)
        let colourGrey:UIColor = UIColor(
            red:0.9,
            green:0.9,
            blue:0.9,
            alpha:1)
        let colourGreyLight:UIColor = UIColor(
            red:0.97,
            green:0.97,
            blue:0.97,
            alpha:1)
        
        let colours:[UIColor] = [
            colourSuccess,
            colourFail,
            colourRed,
            colourGreenDark,
            colourYellow,
            colourBlue,
            colourGrey,
            colourGreyLight]
        
        return colours
    }
}
