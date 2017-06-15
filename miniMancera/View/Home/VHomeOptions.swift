import UIKit

class VHomeOptions:UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    private weak var controller:CHome!
    private weak var collectionView:VCollection!
    private let kDeselectTime:TimeInterval = 0.3
    private let kInterItem:CGFloat = 5
    private let kCellSize:CGFloat = 120
    
    init(controller:CHome)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        isHidden = true
        self.controller = controller
        
        let collectionView:VCollection = VCollection()
        collectionView.alwaysBounceHorizontal = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerCell(cell:VHomeOptionsCell.self)
        self.collectionView = collectionView
        
        if let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.scrollDirection = UICollectionViewScrollDirection.horizontal
            flow.itemSize = CGSize(width:kCellSize, height:kCellSize)
            flow.minimumLineSpacing = kInterItem
            flow.minimumInteritemSpacing = kInterItem
        }
        
        addSubview(collectionView)
        
        NSLayoutConstraint.equals(
            view:collectionView,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func modelAtIndex(index:IndexPath) -> MHomeOptionsProtocol
    {
        let item:MHomeOptionsProtocol = controller.model.options[index.item]
        
        return item
    }
    
    //MARK: public
    
    func refresh()
    {
        collectionView.reloadData()
        isHidden = false
    }
    
    //MARK: collectionView delegate
    
    func collectionView(_ collectionView:UICollectionView, layout collectionViewLayout:UICollectionViewLayout, insetForSectionAt section:Int) -> UIEdgeInsets
    {
        let height:CGFloat = collectionView.bounds.height
        let remainHeight:CGFloat = height - kCellSize
        let margin:CGFloat = remainHeight / 2.0
        let insets:UIEdgeInsets = UIEdgeInsets(
            top:margin,
            left:kInterItem,
            bottom:margin,
            right:kInterItem)
        
        return insets
    }
    
    func numberOfSections(in collectionView:UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView:UICollectionView, numberOfItemsInSection section:Int) -> Int
    {
        let count:Int = controller.model.options.count
        
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let item:MHomeOptionsProtocol = modelAtIndex(index:indexPath)
        let cell:VHomeOptionsCell = collectionView.dequeueReusableCell(
            withReuseIdentifier:
            VHomeOptionsCell.reusableIdentifier,
            for:indexPath) as! VHomeOptionsCell
        cell.config(model:item)
        
        return cell
    }
    
    func collectionView(_ collectionView:UICollectionView, didSelectItemAt indexPath:IndexPath)
    {
        collectionView.isUserInteractionEnabled = false
        
        let item:MHomeOptionsProtocol = modelAtIndex(index:indexPath)
        
        if item.available
        {
            controller.optionSelected(option:item)
        }
        else
        {
            
        }
        
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
