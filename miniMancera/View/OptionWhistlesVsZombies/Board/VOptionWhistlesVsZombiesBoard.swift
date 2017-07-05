import UIKit

class VOptionWhistlesVsZombiesBoard:View, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    private weak var collectionView:VCollection!
    private let kBarHeight:CGFloat = 100
    private let kCellWidth:CGFloat = 200
    
    required init(controller:UIViewController)
    {
        super.init(controller:controller)
        backgroundColor = UIColor.clear
        
        guard
            
            let controller:COptionWhistlesVsZombiesBoard = self.controller as? COptionWhistlesVsZombiesBoard
        
        else
        {
            return
        }
        
        let blur:VBlur = VBlur.dark()
        
        let bar:VOptionWhistlesVsZombiesBoardBar = VOptionWhistlesVsZombiesBoardBar(
            controller:controller)
        
        let collectionView:VCollection = VCollection()
        collectionView.alwaysBounceHorizontal = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerCell(cell:VOptionWhistlesVsZombiesBoardCell.self)
        self.collectionView = collectionView
        
        if let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.scrollDirection = UICollectionViewScrollDirection.horizontal
        }
        
        addSubview(blur)
        addSubview(bar)
        addSubview(collectionView)
        
        NSLayoutConstraint.equals(
            view:blur,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:bar,
            toView:self)
        NSLayoutConstraint.height(
            view:bar,
            constant:kBarHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:bar,
            toView:self)
        
        NSLayoutConstraint.topToBottom(
            view:collectionView,
            toView:bar)
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
    
    //MARK: private
    
    private func modelAtIndex(index:IndexPath) -> MOptionWhistlesVsZombiesBoardItemProtocol
    {
        let controller:COptionWhistlesVsZombiesBoard = self.controller as! COptionWhistlesVsZombiesBoard
        let item:MOptionWhistlesVsZombiesBoardItemProtocol = controller.model.items[index.item]
        
        return item
    }
    
    //MARK: collectionView delegate
    
    func numberOfSections(in collectionView:UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView:UICollectionView, numberOfItemsInSection section:Int) -> Int
    {
        let controller:COptionWhistlesVsZombiesBoard = self.controller as! COptionWhistlesVsZombiesBoard
        let count:Int = controller.model.items.count
        
        return count
    }
    
    func collectionView(_ collectionView:UICollectionView, cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let item:MOptionWhistlesVsZombiesBoardItemProtocol = modelAtIndex(index:indexPath)
        let cell:VOptionWhistlesVsZombiesBoardCell = collectionView.dequeueReusableCell(
            withReuseIdentifier:VOptionWhistlesVsZombiesBoardCell.reusableIdentifier,
            for:indexPath) as! VOptionWhistlesVsZombiesBoardCell
        cell.config(model:item)
        
        return cell
    }
}
