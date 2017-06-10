import UIKit

class VShareCellPng:VShareCell
{
    private let kShareWidth:CGFloat = 75
    private let kShareInsets:CGFloat = 6
    private let kTitleWidth:CGFloat = 300
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        
        let buttonShare:UIButton = UIButton()
        buttonShare.translatesAutoresizingMaskIntoConstraints = false
        buttonShare.clipsToBounds = true
        buttonShare.setImage(
            #imageLiteral(resourceName: "assetGenericShareColor").withRenderingMode(UIImageRenderingMode.alwaysOriginal),
            for:UIControlState.normal)
        buttonShare.setImage(
            #imageLiteral(resourceName: "assetGenericShareColor").withRenderingMode(UIImageRenderingMode.alwaysTemplate),
            for:UIControlState.highlighted)
        buttonShare.imageView!.clipsToBounds = true
        buttonShare.imageView!.contentMode = UIViewContentMode.center
        buttonShare.imageView!.tintColor = UIColor.punkOrange
        buttonShare.imageEdgeInsets = UIEdgeInsets(
            top:0,
            left:0,
            bottom:kShareInsets,
            right:0)
        buttonShare.addTarget(
            self,
            action:#selector(actionShare(sender:)),
            for:UIControlEvents.touchUpInside)
        
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.text = NSLocalizedString("VShareCellPng_labelTitle", comment:"")
        labelTitle.textColor = UIColor.black
        labelTitle.font = UIFont.regular(size:15)
        labelTitle.textAlignment = NSTextAlignment.right
        
        addSubview(labelTitle)
        addSubview(buttonShare)
        
        NSLayoutConstraint.equalsVertical(
            view:buttonShare,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:buttonShare,
            toView:self)
        NSLayoutConstraint.width(
            view:buttonShare,
            constant:kShareWidth)
        
        NSLayoutConstraint.equalsVertical(
            view:labelTitle,
            toView:self)
        NSLayoutConstraint.rightToLeft(
            view:labelTitle,
            toView:buttonShare)
        NSLayoutConstraint.width(
            view:labelTitle,
            constant:kTitleWidth)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: actions
    
    func actionShare(sender button:UIButton)
    {
        controller?.sharePng()
    }
}
