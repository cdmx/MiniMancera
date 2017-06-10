import UIKit

class VHomeFooter:UICollectionReusableView
{
    private let kHorizontalMargin:CGFloat = 20
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        isUserInteractionEnabled = false
        backgroundColor = UIColor.clear
        
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.numberOfLines = 0
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont.regular(size:15)
        label.textColor = UIColor(white:0.2, alpha:1)
        label.text = NSLocalizedString("VHomeFooter_label", comment:"")
        
        addSubview(label)
        
        NSLayoutConstraint.equalsVertical(
            view:label,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:label,
            toView:self,
            margin:kHorizontalMargin)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
