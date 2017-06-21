import UIKit

class VHomeFroobContent:UIView
{
    private weak var controller:CHomeFroob!
    private weak var labelTitle:UILabel!
    private weak var layoutBaseLeft:NSLayoutConstraint!
    private let kCornerRadius:CGFloat = 20
    private let kTitleMargin:CGFloat = 25
    private let kTitleHeight:CGFloat = 180
    private let kTitleTop:CGFloat = -35
    private let kButtonsHeight:CGFloat = 62
    
    init(controller:CHomeFroob)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let baseView:UIView = UIView()
        baseView.translatesAutoresizingMaskIntoConstraints = false
        baseView.clipsToBounds = true
        baseView.backgroundColor = UIColor.black
        baseView.layer.cornerRadius = kCornerRadius
        
        let imageView:UIImageView = UIImageView()
        imageView.isUserInteractionEnabled = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = UIViewContentMode.center
        imageView.image = controller.option.thumbnail
        
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.textAlignment = NSTextAlignment.center
        labelTitle.numberOfLines = 0
        self.labelTitle = labelTitle
        
        let viewButtons:VHomeFroobContentButtons = VHomeFroobContentButtons(
            controller:controller)
        
        baseView.addSubview(viewButtons)
        addSubview(baseView)
        addSubview(imageView)
        addSubview(labelTitle)
        
        NSLayoutConstraint.bottomToBottom(
            view:baseView,
            toView:self)
        NSLayoutConstraint.height(
            view:baseView,
            constant:kBaseHeight)
        layoutBaseLeft = NSLayoutConstraint.leftToLeft(
            view:baseView,
            toView:self)
        NSLayoutConstraint.width(
            view:baseView,
            constant:kBaseWidth)
        
        NSLayoutConstraint.topToTop(
            view:circle,
            toView:self,
            constant:kCircleTop)
        layoutCircleLeft = NSLayoutConstraint.leftToLeft(
            view:circle,
            toView:self)
        NSLayoutConstraint.size(
            view:circle,
            constant:kCircleSize)
        
        NSLayoutConstraint.equals(
            view:imageView,
            toView:circle)
        
        NSLayoutConstraint.topToBottom(
            view:labelTitle,
            toView:circle,
            constant:kTitleTop)
        NSLayoutConstraint.height(
            view:labelTitle,
            constant:kTitleHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:labelTitle,
            toView:baseView,
            margin:kTitleMargin)
        
        NSLayoutConstraint.bottomToBottom(
            view:viewButtons,
            toView:baseView)
        NSLayoutConstraint.height(
            view:viewButtons,
            constant:kButtonsHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewButtons,
            toView:baseView)
        
        printInfo()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        let width:CGFloat = bounds.maxX
        let remainBase:CGFloat = width - kBaseWidth
        let baseLeft:CGFloat = remainBase / 2.0
        let remainCircle:CGFloat = width - kCircleSize
        let circleLeft:CGFloat = remainCircle / 2.0
        
        layoutBaseLeft.constant = baseLeft
        layoutCircleLeft.constant = circleLeft
        
        super.layoutSubviews()
    }
    
    //MARK: private
    
    private func printInfo()
    {
        guard
            
            let title:String = controller.option.title
        
        else
        {
            return
        }
        
        let attributesTitle:[String:AnyObject] = [
            NSFontAttributeName:UIFont.bold(size:22),
            NSForegroundColorAttributeName:UIColor.white]
        let attributesSubtitle:[String:AnyObject] = [
            NSFontAttributeName:UIFont.regular(size:15),
            NSForegroundColorAttributeName:UIColor.white]
        let stringTitle:NSAttributedString = NSAttributedString(
            string:title,
            attributes:attributesTitle)
        let stringSubtitle:NSAttributedString = NSAttributedString(
            string:String.localized(key:"VHomeFroobContent_labelSubtitle"),
            attributes:attributesSubtitle)
        let mutableString:NSMutableAttributedString = NSMutableAttributedString()
        mutableString.append(stringTitle)
        mutableString.append(stringSubtitle)
        
        labelTitle.attributedText = mutableString
    }
}
