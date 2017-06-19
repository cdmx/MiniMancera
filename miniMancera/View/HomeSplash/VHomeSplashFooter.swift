import UIKit

class VHomeSplashFooter:UIView
{
    private weak var controller:CHomeSplash!
    private weak var layoutCloseLeft:NSLayoutConstraint!
    private let kLabelMargin:CGFloat = 10
    private let kLabelHeight:CGFloat = 500
    private let kCornerRadius:CGFloat = 6
    private let kCloseHeight:CGFloat = 32
    private let kCloseWidth:CGFloat = 84
    private let kCloseBottom:CGFloat = -20
    
    init(controller:CHomeSplash)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let buttonClose:UIButton = UIButton()
        buttonClose.translatesAutoresizingMaskIntoConstraints = false
        buttonClose.clipsToBounds = true
        buttonClose.backgroundColor = UIColor.colourFail
        buttonClose.layer.cornerRadius = kCornerRadius
        buttonClose.setTitleColor(
            UIColor.white,
            for:UIControlState.normal)
        buttonClose.setTitleColor(
            UIColor(white:1, alpha:0.4),
            for:UIControlState.highlighted)
        buttonClose.setTitle(
            String.localized(key:"VHomeSplashFooter_buttonClose"),
            for:UIControlState.normal)
        buttonClose.titleLabel!.font = UIFont.bold(size:15)
        buttonClose.addTarget(
            self,
            action:#selector(actionClose(sender:)),
            for:UIControlEvents.touchUpInside)
        
        addSubview(buttonClose)
        
        NSLayoutConstraint.bottomToBottom(
            view:buttonClose,
            toView:self,
            constant:kCloseBottom)
        NSLayoutConstraint.height(
            view:buttonClose,
            constant:kCloseHeight)
        layoutCloseLeft = NSLayoutConstraint.leftToLeft(
            view:buttonClose,
            toView:self)
        NSLayoutConstraint.width(
            view:buttonClose,
            constant:kCloseWidth)
        
        createText()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        let width:CGFloat = bounds.maxX
        let remainWidth:CGFloat = width - kCloseWidth
        let margin:CGFloat = remainWidth / 2.0
        layoutCloseLeft.constant = margin
        
        super.layoutSubviews()
    }
    
    //MARK: actions
    
    func actionClose(sender button:UIButton)
    {
        controller.back()
    }
    
    //MARK: private
    
    private func createText()
    {
        /*
        guard
            
            let title:String = controller.model.optionModel.title,
            let descr:String = controller.model.optionModel.descr
            
        else
        {
            return
        }
        
        let attributesTitle:[String:AnyObject] = [
            NSFontAttributeName:UIFont.bold(size:20),
            NSForegroundColorAttributeName:UIColor.white]
        let attributesDescr:[String:AnyObject] = [
            NSFontAttributeName:UIFont.regular(size:15),
            NSForegroundColorAttributeName:UIColor.white]
        
        let stringTitle:NSAttributedString = NSAttributedString(
            string:title,
            attributes:attributesTitle)
        let stringDescr:NSAttributedString = NSAttributedString(
            string:descr,
            attributes:attributesDescr)
        let mutableString:NSMutableAttributedString = NSMutableAttributedString()
        mutableString.append(stringTitle)
        mutableString.append(stringDescr)
        
        let width:CGFloat = UIScreen.main.bounds.size.width
        let usableWidth:CGFloat = width - (kLabelMargin + kLabelMargin)
        let maxSize:CGSize = CGSize(width:usableWidth, height:kLabelHeight)
        let drawingOptions:NSStringDrawingOptions = NSStringDrawingOptions([
            NSStringDrawingOptions.usesFontLeading,
            NSStringDrawingOptions.usesLineFragmentOrigin])
        
        let boundingRects:CGRect = mutableString.boundingRect(
            with:maxSize,
            options:drawingOptions,
            context:nil)
        let height:CGFloat = ceil(boundingRects.size.height)
        
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.numberOfLines = 0
        label.attributedText = mutableString
        
        addSubview(label)
        
        NSLayoutConstraint.topToTop(
            view:label,
            toView:self,
            constant:kLabelMargin)
        NSLayoutConstraint.leftToLeft(
            view:label,
            toView:self,
            constant:kLabelMargin)
        NSLayoutConstraint.width(
            view:label,
            constant:usableWidth)
        NSLayoutConstraint.height(
            view:label,
            constant:height)*/
    }
}
