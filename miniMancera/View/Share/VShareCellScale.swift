import UIKit

class VShareCellScale:VShareCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    private weak var collectionView:VCollection!
    private let kBottom:CGFloat = -40
    private let kCellWidth:CGFloat = 80
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        
        let collectionView:VCollection = VCollection()
        collectionView.bounces = false
        collectionView.isScrollEnabled = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerCell(cell:VShareCellScaleCell.self)
        self.collectionView = collectionView
        
        if let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.scrollDirection = UICollectionViewScrollDirection.horizontal
        }
        
        addSubview(collectionView)
        
        NSLayoutConstraint.topToTop(
            view:collectionView,
            toView:self)
        NSLayoutConstraint.bottomToBottom(
            view:collectionView,
            toView:self,
            constant:kBottom)
        NSLayoutConstraint.equalsHorizontal(
            view:collectionView,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        collectionView.collectionViewLayout.invalidateLayout()
        super.layoutSubviews()
    }
    
    override func config(controller:CShare)
    {
        super.config(controller:controller)
        collectionView.reloadData()
        selectCurrent()
    }
    
    //MARK: private
    
    private func modelAtIndex(index:IndexPath) -> CGFloat
    {
        let item:CGFloat = controller!.model.scales[index.item]
        
        return item
    }
    
    private func selectCurrent()
    {
        guard
        
            let selected:Int = controller?.model.selectedScale
        
        else
        {
            return
        }
        
        let index:IndexPath = IndexPath(item:selected, section:0)
        collectionView.selectItem(
            at:index,
            animated:true,
            scrollPosition:UICollectionViewScrollPosition())
    }
    
    //MARK: collectionView delegate
    
    func collectionView(_ collectionView:UICollectionView, layout collectionViewLayout:UICollectionViewLayout, insetForSectionAt section:Int) -> UIEdgeInsets
    {
        let width:CGFloat = collectionView.bounds.maxX
        let items:CGFloat = CGFloat(controller!.model.scales.count)
        let widthItems:CGFloat = items * kCellWidth
        let remainWidth:CGFloat = width - widthItems
        let marginHorizontal:CGFloat = remainWidth / 2.0
        let insets:UIEdgeInsets = UIEdgeInsets(
            top:0,
            left:marginHorizontal,
            bottom:0,
            right:marginHorizontal)
        
        return insets
    }
    
    func collectionView(_ collectionView:UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAt indexPath:IndexPath) -> CGSize
    {
        let height:CGFloat = collectionView.bounds.maxY
        let size:CGSize = CGSize(width:kCellWidth, height:height)
        
        return size
    }
    
    func numberOfSections(in collectionView:UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView:UICollectionView, numberOfItemsInSection section:Int) -> Int
    {
        guard
        
            let count:Int = self.controller?.model.scales.count
        
        else
        {
            return 0
        }
        
        return count
    }
    
    func collectionView(_ collectionView:UICollectionView, cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let item:CGFloat = modelAtIndex(index:indexPath)
        let cell:VShareCellScaleCell = collectionView.dequeueReusableCell(
            withReuseIdentifier:
            VShareCellScaleCell.reusableIdentifier,
            for:indexPath) as! VShareCellScaleCell
        cell.config(scale:item)
        
        return cell
    }
    
    func collectionView(_ collectionView:UICollectionView, shouldSelectItemAt indexPath:IndexPath) -> Bool
    {
        guard
        
            let selected:Int = controller?.model.selectedScale
        
        else
        {
            return false
        }
        
        if selected == indexPath.item
        {
            return false
        }
        
        return true
    }
    
    func collectionView(_ collectionView:UICollectionView, didSelectItemAt indexPath:IndexPath)
    {
        controller?.model.selectedScale = indexPath.item
    }
}
