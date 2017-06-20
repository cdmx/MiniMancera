import UIKit

class VHomeSplashCellOptions:VHomeSplashCell
{
    private let kButtonsWidth:CGFloat = 140
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        
        let buttonPlay:VHomeSplashCellOptionsButton = VHomeSplashCellOptionsButton(
            image:#imageLiteral(resourceName: "assetGenericPlay"),
            text:"Jugar",
            alignment:NSTextAlignment.right)
        
        
        addSubview(buttonPlay)
        
        NSLayoutConstraint.equalsVertical(
            view:buttonPlay,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:buttonPlay,
            toView:self)
        NSLayoutConstraint.width(
            view:buttonPlay,
            constant:kButtonsWidth)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
