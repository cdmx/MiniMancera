import UIKit

class VHomeFroobContent:UIView
{
    private weak var controller:CHomeFroob!
    private weak var labelTitle:UILabel!
    private weak var layoutBaseLeft:NSLayoutConstraint!
    private weak var layoutCircleLeft:NSLayoutConstraint!
    private let kBaseWidth:CGFloat = 299
    private let kBaseHeight:CGFloat = 260
    private let kBaseBottom:CGFloat = -2
    private let kCornerRadius:CGFloat = 20
    private let kCircleTop:CGFloat = 2
    private let kCircleSize:CGFloat = 90
    private let kTitleMargin:CGFloat = 10
    private let kTitleHeight:CGFloat = 140
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
        baseView.backgroundColor = UIColor.white
        baseView.layer.cornerRadius = kCornerRadius
        
        let circle:UIView = UIView()
        circle.isUserInteractionEnabled = false
        circle.translatesAutoresizingMaskIntoConstraints = false
        circle.clipsToBounds = true
        circle.backgroundColor = UIColor.white
        circle.layer.cornerRadius = kCircleSize / 2.0
        
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
        
        circle.addSubview(imageView)
        baseView.addSubview(viewButtons)
        addSubview(baseView)
        addSubview(circle)
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
            toView:circle)
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
            NSFontAttributeName:UIFont.bold(size:18),
            NSForegroundColorAttributeName:UIColor.black]
        let attributesSubtitle:[String:AnyObject] = [
            NSFontAttributeName:UIFont.regular(size:17),
            NSForegroundColorAttributeName:UIColor.black]
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
