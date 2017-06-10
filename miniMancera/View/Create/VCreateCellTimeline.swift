import UIKit

class VCreateCellTimeline:VCreateCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    private weak var collectionView:VCollection!
    private let kCellWidth:CGFloat = 75
    private let kFooterWidth:CGFloat = 70
    private let kBorderHeight:CGFloat = 1
    private let kAfterAddRefresh:TimeInterval = 0.2
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        
        let border:VBorder = VBorder(color:UIColor(white:0, alpha:0.1))
        
        let collectionView:VCollection = VCollection()
        collectionView.alwaysBounceHorizontal = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerCell(cell:VCreateCellTimelineCell.self)
        collectionView.registerFooter(footer:VCreateCellTimelineFooter.self)
        self.collectionView = collectionView
        
        if let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.scrollDirection = UICollectionViewScrollDirection.horizontal
            flow.footerReferenceSize = CGSize(width:kFooterWidth, height:0)
        }
        
        addSubview(collectionView)
        addSubview(border)
        
        NSLayoutConstraint.equals(
            view:collectionView,
            toView:self)
        
        NSLayoutConstraint.bottomToBottom(
            view:border,
            toView:self)
        NSLayoutConstraint.height(
            view:border,
            constant:kBorderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:border,
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
    
    override func config(controller:CCreate)
    {
        super.config(controller:controller)
        collectionView.reloadData()
        selectCurrent()
    }
    
    //MARK: private
    
    private func modelAtIndex(index:IndexPath) -> MCreateFrame
    {
        let item:MCreateFrame = controller!.model.frames[index.item]
        
        return item
    }
    
    private func refreshFrame()
    {
        DispatchQueue.main.asyncAfter(
            deadline:DispatchTime.now() + kAfterAddRefresh)
        { [weak controller] in
            
            controller?.refreshFrame()
        }
    }
    
    private func selectCurrent()
    {
        guard
            
            let controller:CCreate = self.controller
        
        else
        {
            return
        }
        
        if controller.model.frames.count > 0
        {
            let selected:Int = controller.model.selectedFrame
            let indexPath:IndexPath = IndexPath(item:selected, section:0)
            
            collectionView.selectItem(
                at:indexPath,
                animated:true,
                scrollPosition:UICollectionViewScrollPosition.centeredHorizontally)
        }
    }
    
    //MARK: public
    
    func addFrame()
    {
        guard
        
            let controller:CCreate = self.controller
        
        else
        {
            return
        }
        
        let item:Int = controller.model.frames.count
        let index:IndexPath = IndexPath(item:item, section:0)
        let indexes:[IndexPath] = [index]
        
        controller.addFrame()
        collectionView.insertItems(at:indexes)
        collectionView.selectItem(
            at:index,
            animated:true,
            scrollPosition:UICollectionViewScrollPosition.left)
        
        DispatchQueue.main.asyncAfter(
            deadline:DispatchTime.now() + kAfterAddRefresh)
        { [weak controller] in
            
            controller?.refreshFrame()
        }
    }
    
    //MARK: collectionView delegate
    
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
            
            let count:Int = controller?.model.frames.count
        
        else
        {
            return 0
        }
        
        return count
    }
    
    func collectionView(_ collectionView:UICollectionView, viewForSupplementaryElementOfKind kind:String, at indexPath:IndexPath) -> UICollectionReusableView
    {
        let footer:VCreateCellTimelineFooter = collectionView.dequeueReusableSupplementaryView(
            ofKind:kind,
            withReuseIdentifier:
            VCreateCellTimelineFooter.reusableIdentifier,
            for:indexPath) as! VCreateCellTimelineFooter
        footer.config(viewTimeline:self)
        
        return footer
    }
    
    func collectionView(_ collectionView:UICollectionView, cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let item:MCreateFrame = modelAtIndex(index:indexPath)
        let cell:VCreateCellTimelineCell = collectionView.dequeueReusableCell(
            withReuseIdentifier:
            VCreateCellTimelineCell.reusableIdentifier,
            for:indexPath) as! VCreateCellTimelineCell
        cell.config(controller:controller, model:item, index:indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView:UICollectionView, shouldSelectItemAt indexPath:IndexPath) -> Bool
    {
        guard
            
            let controller:CCreate = self.controller
            
        else
        {
            return false
        }
        
        if controller.model.selectedFrame == indexPath.item
        {
            return false
        }
        
        return true
    }
    
    func collectionView(_ collectionView:UICollectionView, didSelectItemAt indexPath:IndexPath)
    {
        guard
            
            let controller:CCreate = self.controller
            
        else
        {
            return
        }
        
        controller.model.selectedFrame = indexPath.item
        refreshFrame()
    }
}
