import UIKit

class VHomeSplashCellDescr:VHomeSplashCell
{
    private weak var labelDescr:UILabel!
    private weak var layoutLabelTop:NSLayoutConstraint!
    private weak var layoutLabelBottom:NSLayoutConstraint!
    private weak var layoutLabelLeft:NSLayoutConstraint!
    private weak var layoutLabelRight:NSLayoutConstraint!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        isUserInteractionEnabled = false
        
        let labelDescr:UILabel = UILabel()
        labelDescr.isUserInteractionEnabled = false
        labelDescr.translatesAutoresizingMaskIntoConstraints = false
        labelDescr.backgroundColor = UIColor.clear
        labelDescr.numberOfLines = 0
        self.labelDescr = labelDescr
        
        addSubview(labelDescr)
        
        layoutLabelTop = NSLayoutConstraint.topToTop(
            view:labelDescr,
            toView:self)
        layoutLabelBottom = NSLayoutConstraint.bottomToBottom(
            view:labelDescr,
            toView:self)
        layoutLabelLeft = NSLayoutConstraint.leftToLeft(
            view:labelDescr,
            toView:self)
        layoutLabelRight = NSLayoutConstraint.rightToRight(
            view:labelDescr,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func config(controller:CHomeSplash, model:MHomeSplashProtocol)
    {
        super.config(controller:controller, model:model)
        
        guard
        
            let model:MHomeSplashDescr = model as? MHomeSplashDescr
        
        else
        {
            return
        }
        
        labelDescr.attributedText = model.attributedString
        layoutLabelTop.constant = model.kVerticalMargin
        layoutLabelBottom.constant = -model.kVerticalMargin
        layoutLabelLeft.constant = model.kMarginHorizontal
        layoutLabelRight.constant = -model.kMarginHorizontal
    }
}
