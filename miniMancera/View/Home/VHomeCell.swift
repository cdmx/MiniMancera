import UIKit

class VHomeCell:UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    private weak var controller:CHome?
    private weak var model:MHomeItem?
    private weak var viewBackground:UIView?
    private weak var collectionView:VCollection!
    private weak var labelText:UILabel!
    private weak var labelDuration:UILabel!
    private let numberFormatter:NumberFormatter
    private let kActionsHeight:CGFloat = 50
    private let kBackgroundHeight:CGFloat = 250
    private let kBorderHeight:CGFloat = 1
    private let kTextMarginVertical:CGFloat = 5
    private let kTextMarginHorizontal:CGFloat = 30
    private let kDurationHeight:CGFloat = 50
    private let kDurationWidth:CGFloat = 250
    private let kDurationLeft:CGFloat = 10
    private let kMaxDecimals:Int = 0
    private let kMinIntegers:Int = 1
    private let kDeselectTime:TimeInterval = 0.2
    
    override init(frame:CGRect)
    {
        numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.maximumFractionDigits = kMaxDecimals
        numberFormatter.minimumIntegerDigits = kMinIntegers
        numberFormatter.positiveSuffix = NSLocalizedString("VHomeCell_durationSeconds", comment:"")
        
        super.init(frame:frame)
        backgroundColor = UIColor.white
        clipsToBounds = true
        
        let borderTop:VBorder = VBorder(color:UIColor(white:0, alpha:0.2))
        let borderBottom:VBorder = VBorder(color:UIColor.black)
        
        let labelText:UILabel = UILabel()
        labelText.isUserInteractionEnabled = false
        labelText.translatesAutoresizingMaskIntoConstraints = false
        labelText.backgroundColor = UIColor.clear
        labelText.textColor = UIColor.white
        labelText.numberOfLines = 0
        labelText.textAlignment = NSTextAlignment.center
        self.labelText = labelText
        
        let labelDuration:UILabel = UILabel()
        labelDuration.isUserInteractionEnabled = false
        labelDuration.translatesAutoresizingMaskIntoConstraints = false
        labelDuration.backgroundColor = UIColor.clear
        labelDuration.font = UIFont.regular(size:13)
        labelDuration.textColor = UIColor.black
        self.labelDuration = labelDuration
        
        let collectionView:VCollection = VCollection()
        collectionView.isScrollEnabled = false
        collectionView.bounces = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerCell(cell:VHomeCellAction.self)
        self.collectionView = collectionView
        
        if let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.scrollDirection = UICollectionViewScrollDirection.horizontal
            flow.itemSize = CGSize(width:kActionsHeight, height:kActionsHeight)
        }
        
        addSubview(borderTop)
        addSubview(borderBottom)
        addSubview(labelText)
        addSubview(labelDuration)
        addSubview(collectionView)
        
        NSLayoutConstraint.topToTop(
            view:borderTop,
            toView:self)
        NSLayoutConstraint.height(
            view:borderTop,
            constant:kBorderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:borderTop,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:borderBottom,
            toView:self,
            constant:kBackgroundHeight)
        NSLayoutConstraint.height(
            view:borderBottom,
            constant:kBorderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:borderBottom,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:labelText,
            toView:borderTop,
            constant:kTextMarginVertical)
        NSLayoutConstraint.bottomToBottom(
            view:labelText,
            toView:borderBottom,
            constant:-kTextMarginVertical)
        NSLayoutConstraint.equalsHorizontal(
            view:labelText,
            toView:self,
            margin:kTextMarginHorizontal)
        
        NSLayoutConstraint.bottomToBottom(
            view:labelDuration,
            toView:self)
        NSLayoutConstraint.height(
            view:labelDuration,
            constant:kDurationHeight)
        NSLayoutConstraint.leftToLeft(
            view:labelDuration,
            toView:self,
            constant:kDurationLeft)
        NSLayoutConstraint.width(
            view:labelDuration,
            constant:kDurationWidth)
        
        NSLayoutConstraint.topToBottom(
            view:collectionView,
            toView:borderBottom)
        NSLayoutConstraint.height(
            view:collectionView,
            constant:kActionsHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:collectionView,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func addBackground(model:MHomeItem)
    {
        self.viewBackground?.removeFromSuperview()
        
        let viewBackground:UIView = model.background.view()
        self.viewBackground = viewBackground
        
        insertSubview(viewBackground, at:0)
        
        NSLayoutConstraint.topToTop(
            view:viewBackground,
            toView:self)
        NSLayoutConstraint.height(
            view:viewBackground,
            constant:kBackgroundHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBackground,
            toView:self)
    }
    
    private func addFirstFrameText(model:MHomeItem)
    {
        guard
        
            let frames:[DNoteFrame] = model.note.frames?.array as? [DNoteFrame],
            let firstFrame:DNoteFrame = frames.first
        
        else
        {
            return
        }
        
        labelText.text = firstFrame.text
    }
    
    private func addDuration(model:MHomeItem)
    {
        let durationNumber:NSNumber = model.duration as NSNumber
        let durationString:String? = numberFormatter.string(from:durationNumber)
        labelDuration.text = durationString
    }
    
    private func modelAtIndex(index:IndexPath) -> MHomeProtocol
    {
        let item:MHomeProtocol = controller!.model.actions[index.item]
        
        return item
    }
    
    //MARK: public
    
    func config(controller:CHome, model:MHomeItem)
    {
        self.controller = controller
        self.model = model
        
        labelText.font = model.font()
        addBackground(model:model)
        addFirstFrameText(model:model)
        addDuration(model:model)
    }
    
    //MARK: collectionView delegate
    
    func numberOfSections(in collectionView:UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        guard
        
            let count:Int = controller?.model.actions.count
        
        else
        {
            return 0
        }
        
        return count
    }
    
    func collectionView(_ collectionView:UICollectionView, cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let item:MHomeProtocol = modelAtIndex(index:indexPath)
        let cell:VHomeCellAction = collectionView.dequeueReusableCell(
            withReuseIdentifier:
            VHomeCellAction.reusableIdentifier,
            for:indexPath) as! VHomeCellAction
        cell.config(model:item)
        
        return cell
    }
    
    func collectionView(_ collectionView:UICollectionView, didSelectItemAt indexPath:IndexPath)
    {
        guard
            
            let controller:CHome = self.controller,
            let model:MHomeItem = self.model
        
        else
        {
            return
        }
        
        collectionView.isUserInteractionEnabled = false
        let item:MHomeProtocol = modelAtIndex(index:indexPath)
        item.selected(controller:controller, model:model)
        
        DispatchQueue.main.asyncAfter(
            deadline:DispatchTime.now() + kDeselectTime)
        { [weak collectionView] in
            
            collectionView?.isUserInteractionEnabled = true
            collectionView?.selectItem(
                at:nil,
                animated:true,
                scrollPosition:UICollectionViewScrollPosition())
        }
    }
}
