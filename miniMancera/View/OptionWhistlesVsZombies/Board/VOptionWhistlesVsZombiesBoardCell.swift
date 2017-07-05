import UIKit

class VOptionWhistlesVsZombiesBoardCell:UICollectionViewCell
{
    private weak var imageView:UIImageView!
    private weak var labelTitle:UILabel!
    private weak var labelPrice:UILabel!
    private let kAlphaSelected:CGFloat = 0.3
    private let kAlphaNotSelected:CGFloat = 1
    private let kImageHeight:CGFloat = 110
    private let kTitleHeight:CGFloat = 20
    private let kCoinHeight:CGFloat = 40
    private let kCoinRight:CGFloat = -80
    private let kCoinWidth:CGFloat = 30
    private let kPriceWidth:CGFloat = 60
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        
        let imageView:UIImageView = UIImageView()
        imageView.isUserInteractionEnabled = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = UIViewContentMode.center
        self.imageView = imageView
        
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.textAlignment = NSTextAlignment.center
        labelTitle.font = UIFont.game(size:10)
        labelTitle.textColor = UIColor.white
        self.labelTitle = labelTitle
        
        let imageCoin:UIImageView = UIImageView()
        imageCoin.isUserInteractionEnabled = false
        imageCoin.translatesAutoresizingMaskIntoConstraints = false
        imageCoin.clipsToBounds = true
        imageCoin.contentMode = UIViewContentMode.center
        imageCoin.image = #imageLiteral(resourceName: "assetWhistlesVsZombiesBoardPrice")
        
        let labelPrice:UILabel = UILabel()
        labelPrice.isUserInteractionEnabled = false
        labelPrice.translatesAutoresizingMaskIntoConstraints = false
        labelPrice.backgroundColor = UIColor.clear
        labelPrice.textAlignment = NSTextAlignment.right
        labelPrice.font = UIFont.game(size:16)
        labelPrice.textColor = UIColor(
            red:0.972549019607843,
            green:0.905882352941176,
            blue:0.109803921568627,
            alpha:1)
        self.labelPrice = labelPrice
        
        addSubview(imageCoin)
        addSubview(imageView)
        addSubview(labelTitle)
        addSubview(labelPrice)
        
        NSLayoutConstraint.topToTop(
            view:imageView,
            toView:self)
        NSLayoutConstraint.height(
            view:imageView,
            constant:kImageHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:imageView,
            toView:self)
        
        NSLayoutConstraint.topToBottom(
            view:labelTitle,
            toView:imageView)
        NSLayoutConstraint.height(
            view:labelTitle,
            constant:kTitleHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:labelTitle,
            toView:self)
        
        NSLayoutConstraint.topToBottom(
            view:imageCoin,
            toView:labelTitle)
        NSLayoutConstraint.height(
            view:imageCoin,
            constant:kCoinHeight)
        NSLayoutConstraint.rightToRight(
            view:imageCoin,
            toView:self,
            constant:kCoinRight)
        NSLayoutConstraint.width(
            view:imageCoin,
            constant:kCoinWidth)
        
        NSLayoutConstraint.equalsVertical(
            view:labelPrice,
            toView:imageCoin)
        NSLayoutConstraint.rightToLeft(
            view:labelPrice,
            toView:imageCoin)
        NSLayoutConstraint.width(
            view:labelPrice,
            constant:kPriceWidth)
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
            alpha = kAlphaSelected
        }
        else
        {
            alpha = kAlphaNotSelected
        }
    }
    
    //MARK: public
    
    func config(model:MOptionWhistlesVsZombiesBoardItemProtocol)
    {
        imageView.image = model.image
        labelTitle.text = model.title
        labelPrice.text = "\(model.price)"
    }
}
