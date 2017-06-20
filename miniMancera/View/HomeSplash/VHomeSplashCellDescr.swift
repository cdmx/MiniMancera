import UIKit

class VHomeSplashCellDescr:VHomeSplashCell
{
    private weak var labelDescr:UILabel!
    private let kMarginHorizontal:CGFloat = 10
    
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
        
        NSLayoutConstraint.equalsVertical(
            view:labelDescr,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:labelDescr,
            toView:self,
            margin:kMarginHorizontal)
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
    }
}
