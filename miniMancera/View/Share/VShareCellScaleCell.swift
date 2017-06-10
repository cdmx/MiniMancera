import UIKit

class VShareCellScaleCell:UICollectionViewCell
{
    private weak var labelTitle:UILabel!
    private weak var labelDescr:UILabel!
    private weak var viewCircle:UIView!
    private weak var layoutCircleLeft:NSLayoutConstraint!
    private weak var layoutCircleTop:NSLayoutConstraint!
    private let kCircleSize:CGFloat = 45
    private let kDescrHeight:CGFloat = 25
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.font = UIFont.regular(size:20)
        labelTitle.textAlignment = NSTextAlignment.center
        labelTitle.backgroundColor = UIColor.clear
        self.labelTitle = labelTitle
        
        let labelDescr:UILabel = UILabel()
        labelDescr.isUserInteractionEnabled = false
        labelDescr.translatesAutoresizingMaskIntoConstraints = false
        labelDescr.font = UIFont.regular(size:13)
        labelDescr.textAlignment = NSTextAlignment.center
        labelDescr.backgroundColor = UIColor.clear
        self.labelDescr = labelDescr
        
        let viewCircle:UIView = UIView()
        viewCircle.translatesAutoresizingMaskIntoConstraints = false
        viewCircle.clipsToBounds = true
        viewCircle.isUserInteractionEnabled = false
        viewCircle.backgroundColor = UIColor.punkPurple
        viewCircle.layer.cornerRadius = kCircleSize / 2.0
        self.viewCircle = viewCircle
        
        addSubview(labelDescr)
        addSubview(viewCircle)
        addSubview(labelTitle)
        
        NSLayoutConstraint.equals(
            view:labelTitle,
            toView:self)
        
        layoutCircleTop = NSLayoutConstraint.topToTop(
            view:viewCircle,
            toView:self)
        layoutCircleLeft = NSLayoutConstraint.leftToLeft(
            view:viewCircle,
            toView:self)
        NSLayoutConstraint.size(
            view:viewCircle,
            constant:kCircleSize)
        
        NSLayoutConstraint.bottomToBottom(
            view:labelDescr,
            toView:self)
        NSLayoutConstraint.height(
            view:labelDescr,
            constant:kDescrHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:labelDescr,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        let width:CGFloat = bounds.maxX
        let height:CGFloat = bounds.maxY
        let remainWidth:CGFloat = width - kCircleSize
        let remainHeight:CGFloat = height - kCircleSize
        let marginLeft:CGFloat = remainWidth / 2.0
        let marginTop:CGFloat = remainHeight / 2.0
        layoutCircleLeft.constant = marginLeft
        layoutCircleTop.constant = marginTop
        
        super.layoutSubviews()
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
            labelTitle.textColor = UIColor.white
            labelDescr.textColor = UIColor.black
            viewCircle.isHidden = false
        }
        else
        {
            labelTitle.textColor = UIColor(white:0.75, alpha:1)
            labelDescr.textColor = UIColor(white:0.6, alpha:1)
            viewCircle.isHidden = true
        }
    }
    
    private func printDescr(scale:CGFloat)
    {
        let width:CGFloat = MShare.widthForScale(scale:scale)
        let height:CGFloat = MShare.heightForScale(scale:scale)
        let widthNumber:NSNumber = width as NSNumber
        let heightNumber:NSNumber = height as NSNumber
        let stringDescr:String = String(
            format:NSLocalizedString("VShareCellScaleCell_labelDescr", comment:""),
            widthNumber,
            heightNumber)
        labelDescr.text = stringDescr
    }
    
    //MARK: public
    
    func config(scale:CGFloat)
    {
        let scaleNumber:NSNumber = scale as NSNumber
        let stringTitle:String = String(
            format:NSLocalizedString("VShareCellScaleCell_labelTitle", comment:""),
            scaleNumber)
        labelTitle.text = stringTitle
        printDescr(scale:scale)
        
        hover()
    }
}
