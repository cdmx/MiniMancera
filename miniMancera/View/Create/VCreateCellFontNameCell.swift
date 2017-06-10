import UIKit

class VCreateCellFontNameCell:UICollectionViewCell
{
    private weak var viewBorder:VBorder!
    private weak var labelType:UILabel!
    private weak var labelName:UILabel!
    private weak var model:MCreateFontItem?
    private let kAlphaSelected:CGFloat = 1
    private let kAlphaNotSelected:CGFloat = 0.3
    private let kBorderHeight:CGFloat = 30
    private let kFontSizeType:CGFloat = 22
    private let kBorderWidth:CGFloat = 1
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.white
        layer.borderWidth = kBorderWidth
        
        let viewBorder:VBorder = VBorder(color:UIColor.punkOrange)
        self.viewBorder = viewBorder
        
        let labelType:UILabel = UILabel()
        labelType.translatesAutoresizingMaskIntoConstraints = false
        labelType.backgroundColor = UIColor.clear
        labelType.isUserInteractionEnabled = false
        labelType.textColor = UIColor.black
        labelType.textAlignment = NSTextAlignment.center
        labelType.text = NSLocalizedString("VCreateCellFontNameCell_labelType", comment:"")
        self.labelType = labelType
        
        let labelName:UILabel = UILabel()
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.isUserInteractionEnabled = false
        labelName.backgroundColor = UIColor.clear
        labelName.isUserInteractionEnabled = false
        labelName.textAlignment = NSTextAlignment.center
        labelName.font = UIFont.regular(size:14)
        self.labelName = labelName
        
        addSubview(labelType)
        addSubview(viewBorder)
        addSubview(labelName)
        
        NSLayoutConstraint.bottomToBottom(
            view:viewBorder,
            toView:self)
        NSLayoutConstraint.height(
            view:viewBorder,
            constant:kBorderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBorder,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:labelType,
            toView:self)
        NSLayoutConstraint.bottomToTop(
            view:labelType,
            toView:viewBorder)
        NSLayoutConstraint.equalsHorizontal(
            view:labelType,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:labelName,
            toView:viewBorder)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override var isSelected:Bool
    {
        didSet
        {
            hover()
        }
    }
    
    override var isHighlighted:Bool
    {
        didSet
        {
            hover()
        }
    }
    
    //MARK: private
    
    private func hover()
    {
        if isSelected || isHighlighted
        {
            viewBorder.alpha = 0.6
            layer.borderColor = UIColor.black.cgColor
            labelType.alpha = kAlphaSelected
            labelName.textColor = UIColor.black
        }
        else
        {
            viewBorder.alpha = 0
            layer.borderColor = UIColor(white:0, alpha:0.1).cgColor
            labelType.alpha = kAlphaNotSelected
            labelName.textColor = UIColor(white:0.25, alpha:1)
        }
    }
    
    //MARK: public
    
    func config(model:MCreateFontItem)
    {
        self.model = model
        labelType.font = model.font(size:kFontSizeType)
        labelName.text = model.displayName
        hover()
    }
}
