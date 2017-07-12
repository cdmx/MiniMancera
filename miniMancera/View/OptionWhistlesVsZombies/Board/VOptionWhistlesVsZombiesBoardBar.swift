import UIKit

class VOptionWhistlesVsZombiesBoardBar:UIView
{
    private weak var controller:COptionWhistlesVsZombiesBoard!
    private let kCancelWidth:CGFloat = 80
    private let kCoinWidth:CGFloat = 50
    private let kCoinLabelTop:CGFloat = -6
    private let kCoinLabelWidth:CGFloat = 200
    
    init(controller:COptionWhistlesVsZombiesBoard)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.textAlignment = NSTextAlignment.center
        labelTitle.textColor = UIColor.white
        labelTitle.font = UIFont.bold(size:16)
        labelTitle.text = String.localizedWhistlesVsZombies(
            key:"VOptionWhistlesVsZombiesBoardBar_labelTitle")
        
        let buttonCancel:UIButton = UIButton()
        buttonCancel.clipsToBounds = true
        buttonCancel.translatesAutoresizingMaskIntoConstraints = false
        buttonCancel.setImage(
            #imageLiteral(resourceName: "assetWhistlesVsZombiesWhistleBoardCancel"),
            for:UIControlState.normal)
        buttonCancel.imageView!.clipsToBounds = true
        buttonCancel.imageView!.contentMode = UIViewContentMode.center
        buttonCancel.addTarget(
            self,
            action:#selector(actionCancel(sender:)),
            for:UIControlEvents.touchUpInside)
        
        let imageCoin:UIImageView = UIImageView()
        imageCoin.isUserInteractionEnabled = false
        imageCoin.translatesAutoresizingMaskIntoConstraints = false
        imageCoin.clipsToBounds = true
        imageCoin.contentMode = UIViewContentMode.center
        imageCoin.image = #imageLiteral(resourceName: "assetWhistlesVsZombiesBoardPrice")
        
        let labelCoins:UILabel = UILabel()
        labelCoins.isUserInteractionEnabled = false
        labelCoins.translatesAutoresizingMaskIntoConstraints = false
        labelCoins.backgroundColor = UIColor.clear
        labelCoins.textAlignment = NSTextAlignment.right
        labelCoins.font = UIFont.game(size:17)
        labelCoins.textColor = UIColor(
            red:0.972549019607843,
            green:0.905882352941176,
            blue:0.109803921568627,
            alpha:1)
        
        addSubview(labelTitle)
        addSubview(labelCoins)
        addSubview(buttonCancel)
        addSubview(imageCoin)
        
        NSLayoutConstraint.equals(
            view:labelTitle,
            toView:self)
        
        NSLayoutConstraint.equalsVertical(
            view:buttonCancel,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:buttonCancel,
            toView:self)
        NSLayoutConstraint.width(
            view:buttonCancel,
            constant:kCancelWidth)
        
        NSLayoutConstraint.equalsVertical(
            view:imageCoin,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:imageCoin,
            toView:self)
        NSLayoutConstraint.width(
            view:imageCoin,
            constant:kCoinWidth)
        
        NSLayoutConstraint.topToTop(
            view:labelCoins,
            toView:self,
            constant:kCoinLabelTop)
        NSLayoutConstraint.bottomToBottom(
            view:labelCoins,
            toView:self)
        NSLayoutConstraint.rightToLeft(
            view:labelCoins,
            toView:imageCoin)
        NSLayoutConstraint.width(
            view:labelCoins,
            constant:kCoinLabelWidth)
        
        guard
            
            let coins:Int = controller.controllerGame?.model.coins
        
        else
        {
            return
        }
        
        let coinsString:String = "\(coins)"
        labelCoins.text = coinsString
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: actions
    
    func actionCancel(sender button:UIButton)
    {
        controller.back()
    }
}
