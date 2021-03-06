import UIKit

class VOptionWhistlesVsZombiesBoardCell:UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    private weak var model:MOptionWhistlesVsZombiesBoardItemProtocol?
    private weak var collectionView:VCollection!
    private weak var imageView:UIImageView!
    private weak var labelTitle:UILabel!
    private weak var labelPrice:UILabel!
    private let kAlphaSelected:CGFloat = 0.2
    private let kAlphaNotAvailable:CGFloat = 0.6
    private let kAlphaNotSelected:CGFloat = 1
    private let kImageHeight:CGFloat = 125
    private let kTitleHeight:CGFloat = 13
    private let kTitleTop:CGFloat = -10
    private let kCoinHeight:CGFloat = 50
    private let kCoinRight:CGFloat = -55
    private let kCoinWidth:CGFloat = 45
    private let kPriceTop:CGFloat = -3
    private let kPriceWidth:CGFloat = 80
    private let kScoreCellHeight:CGFloat = 26
    private let kBorderWidth:CGFloat = 1
    private let kCornerRadius:CGFloat = 7
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        layer.borderWidth = kBorderWidth
        layer.cornerRadius = kCornerRadius
        layer.borderColor = UIColor.white.cgColor
        
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
        labelTitle.font = UIFont.game(size:6)
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
        labelPrice.font = UIFont.game(size:17)
        self.labelPrice = labelPrice
        
        let collectionView:VCollection = VCollection()
        collectionView.isUserInteractionEnabled = false
        collectionView.isScrollEnabled = false
        collectionView.bounces = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerCell(cell:VOptionWhistlesVsZombiesBoardCellScore.self)
        self.collectionView = collectionView
        
        if let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.itemSize = CGSize(
                width:frame.width,
                height:kScoreCellHeight)
        }
        
        addSubview(imageCoin)
        addSubview(imageView)
        addSubview(labelTitle)
        addSubview(labelPrice)
        addSubview(collectionView)
        
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
            toView:imageView,
            constant:kTitleTop)
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
        
        NSLayoutConstraint.topToBottom(
            view:labelPrice,
            toView:labelTitle,
            constant:kPriceTop)
        NSLayoutConstraint.height(
            view:labelPrice,
            constant:kCoinHeight)
        NSLayoutConstraint.rightToLeft(
            view:labelPrice,
            toView:imageCoin)
        NSLayoutConstraint.width(
            view:labelPrice,
            constant:kPriceWidth)
        
        NSLayoutConstraint.topToBottom(
            view:collectionView,
            toView:imageCoin)
        NSLayoutConstraint.bottomToBottom(
            view:collectionView,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:collectionView,
            toView:self)
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
    
    private func hoverAvailable()
    {
        if isSelected || isHighlighted
        {
            alpha = kAlphaSelected
        }
        else
        {
            alpha = kAlphaNotSelected
        }
        
        labelPrice.textColor = UIColor(
            red:0.972549019607843,
            green:0.905882352941176,
            blue:0.109803921568627,
            alpha:1)
    }
    
    private func hoverNotAvailable()
    {
        alpha = kAlphaNotAvailable
        labelPrice.textColor = UIColor.red
    }
    
    private func hover()
    {
        guard
        
            let model:MOptionWhistlesVsZombiesBoardItemProtocol = self.model
        
        else
        {
            hoverNotAvailable()
            
            return
        }
        
        let available:Bool = model.available
        
        if available
        {
            hoverAvailable()
        }
        else
        {
            hoverNotAvailable()
        }
    }
    
    private func modelAtIndex(index:IndexPath) -> MOptionWhistlesVsZombiesBoardScoreItem
    {
        let item:MOptionWhistlesVsZombiesBoardScoreItem = model!.score.items[index.item]
        
        return item
    }
    
    //MARK: public
    
    func config(model:MOptionWhistlesVsZombiesBoardItemProtocol)
    {
        self.model = model
        imageView.image = model.image
        labelTitle.text = model.title
        labelPrice.text = "\(model.price)"
        
        hover()
        collectionView.reloadData()
    }
    
    //MARK: collectionView delegate
    
    func numberOfSections(in collectionView:UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView:UICollectionView, numberOfItemsInSection section:Int) -> Int
    {
        guard
        
            let count:Int = model?.score.items.count
        
        else
        {
            return 0
        }
        
        return count
    }
    
    func collectionView(_ collectionView:UICollectionView, cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let item:MOptionWhistlesVsZombiesBoardScoreItem = modelAtIndex(index:indexPath)
        let cell:VOptionWhistlesVsZombiesBoardCellScore = collectionView.dequeueReusableCell(
            withReuseIdentifier:
            VOptionWhistlesVsZombiesBoardCellScore.reusableIdentifier,
            for:indexPath) as! VOptionWhistlesVsZombiesBoardCellScore
        cell.config(model:item)
        
        return cell
    }
    
    func collectionView(_ collectionView:UICollectionView, shouldSelectItemAt indexPath:IndexPath) -> Bool
    {
        return false
    }
    
    func collectionView(_ collectionView:UICollectionView, shouldHighlightItemAt indexPath:IndexPath) -> Bool
    {
        return false
    }
}
