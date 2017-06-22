import UIKit

class VHomeFooter:UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    private weak var controller:CHome!
    private let kCellSize:CGFloat = 100
    private let kDeselectTime:TimeInterval = 0.4
    
    init(controller:CHome)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        isHidden = true
        self.controller = controller
        
        let collectionView:VCollection = VCollection()
        collectionView.isScrollEnabled = false
        collectionView.bounces = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerCell(cell:VHomeFooterCell.self)
        
        if let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.scrollDirection = UICollectionViewScrollDirection.horizontal
            flow.itemSize = CGSize(width:kCellSize, height:kCellSize)
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
    
    private func modelAtIndex(index:IndexPath) -> MHomeFooterProtocol
    {
        let item:MHomeFooterProtocol = controller.model.footer[index.item]
        
        return item
    }
    
    //MARK: collectionView delegate
    
    func collectionView(_ collectionView:UICollectionView, layout collectionViewLayout:UICollectionViewLayout, insetForSectionAt section:Int) -> UIEdgeInsets
    {
        let width:CGFloat = collectionView.bounds.maxX
        let height:CGFloat = collectionView.bounds.maxY
        let cells:CGFloat = CGFloat(controller.model.footer.count)
        let cellsWidth:CGFloat = cells * kCellSize
        let remainWidth:CGFloat = width - cellsWidth
        let remainHeight:CGFloat = height - kCellSize
        let remainWidth_2:CGFloat = remainWidth / 2.0
        let insets:UIEdgeInsets = UIEdgeInsets(
            top:0,
            left:remainWidth_2,
            bottom:remainHeight,
            right:remainWidth_2)
        
        return insets
    }
    
    func numberOfSections(in collectionView:UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView:UICollectionView, numberOfItemsInSection section:Int) -> Int
    {
        let count:Int = controller.model.footer.count
        
        return count
    }
    
    func collectionView(_ collectionView:UICollectionView, cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let item:MHomeFooterProtocol = modelAtIndex(index:indexPath)
        let cell:VHomeFooterCell = collectionView.dequeueReusableCell(
            withReuseIdentifier:
            VHomeFooterCell.reusableIdentifier,
            for:indexPath) as! VHomeFooterCell
        cell.config(model:item)
        
        return cell
    }
    
    func collectionView(_ collectionView:UICollectionView, didSelectItemAt indexPath:IndexPath)
    {
        collectionView.isUserInteractionEnabled = false
        
        let item:MHomeFooterProtocol = modelAtIndex(index:indexPath)
        item.selected(controller:controller)
        
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
