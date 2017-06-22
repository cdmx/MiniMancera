import UIKit

class VHomeOptions:UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    private weak var controller:CHome!
    private weak var collectionView:VCollection!
    private let interItem2:CGFloat
    private let kDeselectTime:TimeInterval = 0.3
    private let kInterItem:CGFloat = 2
    private let kCellWidth:CGFloat = 220
    
    init(controller:CHome)
    {
        interItem2 = kInterItem + kInterItem
        
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
    
    private func modelAtIndex(index:IndexPath) -> MHomeOptions
    {
        let item:MHomeOptions = controller.model.options[index.item]
        
        return item
    }
    
    //MARK: public
    
    func refresh()
    {
        collectionView.reloadData()
        isHidden = false
    }
    
    //MARK: collectionView delegate
    
    func collectionView(_ collectionView:UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAt indexPath:IndexPath) -> CGSize
    {
        let height:CGFloat = collectionView.bounds.maxY
        let usableHeight:CGFloat = height - interItem2
        let size:CGSize = CGSize(
            width:kCellWidth,
            height:usableHeight)
        
        return size
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
        let item:MHomeOptions = modelAtIndex(index:indexPath)
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
        
        let item:MHomeOptions = modelAtIndex(index:indexPath)
        controller.optionSelected(option:item)
        
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
