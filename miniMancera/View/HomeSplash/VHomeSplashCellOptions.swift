import UIKit

class VHomeSplashCellOptions:VHomeSplashCell
{
    private let kButtonsWidth:CGFloat = 140
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        
        let buttonPlay:VHomeSplashCellOptionsButton = VHomeSplashCellOptionsButton(
            image:#imageLiteral(resourceName: "assetGenericPlay"),
            text:String.localized(key:"VHomeSplashCellOptions_buttonPlay"),
            alignment:NSTextAlignment.right)
        buttonPlay.addTarget(
            self,
            action:#selector(actionPlay(sender:)),
            for:UIControlEvents.touchUpInside)
        
        let buttonExit:VHomeSplashCellOptionsButton = VHomeSplashCellOptionsButton(
            image:#imageLiteral(resourceName: "assetGenericExit"),
            text:String.localized(key:"VHomeSplashCellOptions_buttonExit"),
            alignment:NSTextAlignment.left)
        buttonExit.addTarget(
            self,
            action:#selector(actionExit(sender:)),
            for:UIControlEvents.touchUpInside)
        
        addSubview(buttonPlay)
        addSubview(buttonExit)
        
        NSLayoutConstraint.equalsVertical(
            view:buttonPlay,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:buttonPlay,
            toView:self)
        NSLayoutConstraint.width(
            view:buttonPlay,
            constant:kButtonsWidth)
        
        NSLayoutConstraint.equalsVertical(
            view:buttonExit,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:buttonExit,
            toView:self)
        NSLayoutConstraint.width(
            view:buttonExit,
            constant:kButtonsWidth)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: actions
    
    func actionPlay(sender button:UIButton)
    {
        controller?.play()
    }
    
    func actionExit(sender button:UIButton)
    {
        controller?.back()
    }
}
