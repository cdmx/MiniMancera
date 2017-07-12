import UIKit

class VOptionWhistlesVsZombiesBoardCellScore:UICollectionViewCell
{
    private weak var imageView:UIImageView!
    private weak var labelTitle:UILabel!
    private let kImageWidth:CGFloat = 90
    private let kImageRight:CGFloat = -30
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        isUserInteractionEnabled = false
        
        let imageView:UIImageView = UIImageView()
        imageView.isUserInteractionEnabled = false
        imageView.clipsToBounds = true
        imageView.contentMode = UIViewContentMode.center
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.imageView = imageView
        
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.font = UIFont.regular(size:11)
        labelTitle.textColor = UIColor.white
        labelTitle.textAlignment = NSTextAlignment.right
        self.labelTitle = labelTitle
        
        addSubview(imageView)
        addSubview(labelTitle)
        
        NSLayoutConstraint.equalsVertical(
            view:imageView,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:imageView,
            toView:self,
            constant:kImageRight)
        NSLayoutConstraint.width(
            view:imageView,
            constant:kImageWidth)
        
        NSLayoutConstraint.equalsVertical(
            view:labelTitle,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:labelTitle,
            toView:self)
        NSLayoutConstraint.rightToLeft(
            view:labelTitle,
            toView:imageView)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func imageForAmount(amount:Int)
    {
        switch amount
        {
        case 0:
            
            imageView.image = #imageLiteral(resourceName: "assetWhistlesVsZombiesBoardScore0")
            
            break
            
        case 1:
            
            imageView.image = #imageLiteral(resourceName: "assetWhistlesVsZombiesBoardScore1")
            
            break
            
        case 2:
            
            imageView.image = #imageLiteral(resourceName: "assetWhistlesVsZombiesBoardScore2")
            
            break
            
        case 3:
            
            imageView.image = #imageLiteral(resourceName: "assetWhistlesVsZombiesBoardScore3")
            
            break
            
        case 4:
            
            imageView.image = #imageLiteral(resourceName: "assetWhistlesVsZombiesBoardScore4")
            
            break
            
        default:
            
            imageView.image = #imageLiteral(resourceName: "assetWhistlesVsZombiesBoardScore5")
            
            break
        }
    }
    
    //MARK: public
    
    func config(model:MOptionWhistlesVsZombiesBoardScoreItem)
    {
        imageForAmount(amount:model.amount)
        labelTitle.text = model.title
    }
}
