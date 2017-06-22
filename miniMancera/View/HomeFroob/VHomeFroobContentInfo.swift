import UIKit

class VHomeFroobContentInfo:UIView
{
    private weak var controller:CHomeFroob!
    private let kSubtitleHeight:CGFloat = 70
    private let kMarginHorizontal:CGFloat = 10
    
    init(controller:CHomeFroob)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = false
        self.controller = controller
        
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.numberOfLines = 0
        labelTitle.textAlignment = NSTextAlignment.center
        labelTitle.font = UIFont.bold(size:17)
        labelTitle.textColor = UIColor.white
        labelTitle.text = controller.option.title
        
        let labelSubtitle:UILabel = UILabel()
        labelSubtitle.isUserInteractionEnabled = false
        labelSubtitle.backgroundColor = UIColor.clear
        labelSubtitle.translatesAutoresizingMaskIntoConstraints = false
        labelSubtitle.numberOfLines = 0
        labelSubtitle.textAlignment = NSTextAlignment.center
        labelSubtitle.font = UIFont.regular(size:14)
        labelSubtitle.textColor = UIColor.white
        labelSubtitle.text = String.localized(key:"VHomeFroobContentInfo_labelSubtitle")
        
        addSubview(labelSubtitle)
        addSubview(labelTitle)
        
        NSLayoutConstraint.bottomToBottom(
            view:labelSubtitle,
            toView:self)
        NSLayoutConstraint.height(
            view:labelSubtitle,
            constant:kSubtitleHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:labelSubtitle,
            toView:self,
            margin:kMarginHorizontal)
        
        NSLayoutConstraint.topToTop(
            view:labelTitle,
            toView:self)
        NSLayoutConstraint.bottomToTop(
            view:labelTitle,
            toView:labelSubtitle)
        NSLayoutConstraint.equalsHorizontal(
            view:labelTitle,
            toView:self,
            margin:kMarginHorizontal)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
