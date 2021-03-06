import UIKit

class VSettings:View, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    private weak var collectionView:VCollection!
    private weak var layoutGradientHeight:NSLayoutConstraint!
    private let kHeaderHeight:CGFloat = 320
    private let kCollectionBottom:CGFloat = 20
    
    required init(controller:UIViewController)
    {
        super.init(controller:controller)
        
        let viewGradient:VGradient = VGradient.diagonal(
            colorLeftBottom:UIColor.colourSuccess,
            colorTopRight:UIColor.colourFail)
        
        let collectionView:VCollection = VCollection()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.alwaysBounceVertical = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerCell(cell:VSettingsCellSounds.self)
        collectionView.registerCell(cell:VSettingsCellReview.self)
        collectionView.registerCell(cell:VSettingsCellShare.self)
        collectionView.registerHeader(header:VSettingsHeader.self)
        self.collectionView = collectionView
        
        if let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.headerReferenceSize = CGSize(width:0, height:kHeaderHeight)
        }
        
        addSubview(viewGradient)
        addSubview(collectionView)
        
        NSLayoutConstraint.topToTop(
            view:viewGradient,
            toView:self)
        layoutGradientHeight = NSLayoutConstraint.height(
            view:viewGradient,
            constant:kHeaderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewGradient,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:collectionView,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func modelAtIndex(index:IndexPath) -> MSettingsProtocol
    {
        let controller:CSettings = self.controller as! CSettings
        let item:MSettingsProtocol = controller.model.items[index.item]
                
        return item
    }
    
    //MARK: collectionView delegate
    
    func scrollViewDidScroll(_ scrollView:UIScrollView)
    {
        let offsetY:CGFloat = scrollView.contentOffset.y
        let gradientHeight:CGFloat
        
        if offsetY < 0
        {
            gradientHeight = kHeaderHeight - offsetY
        }
        else
        {
            gradientHeight = kHeaderHeight
        }
        
        layoutGradientHeight.constant = gradientHeight
    }
    
    func collectionView(_ collectionView:UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAt indexPath:IndexPath) -> CGSize
    {
        let item:MSettingsProtocol = modelAtIndex(index:indexPath)
        let width:CGFloat = bounds.maxX
        let size:CGSize = CGSize(width:width, height:item.cellHeight)
        
        return size
    }
    
    func numberOfSections(in collectionView:UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView:UICollectionView, numberOfItemsInSection section:Int) -> Int
    {
        let controller:CSettings = self.controller as! CSettings
        let count:Int = controller.model.items.count
        
        return count
    }
    
    func collectionView(_ collectionView:UICollectionView, viewForSupplementaryElementOfKind kind:String, at indexPath:IndexPath) -> UICollectionReusableView
    {
        let controller:CSettings = self.controller as! CSettings
        let header:VSettingsHeader = collectionView.dequeueReusableSupplementaryView(
            ofKind:kind,
            withReuseIdentifier:
            VSettingsHeader.reusableIdentifier,
            for:indexPath) as! VSettingsHeader
        header.config(controller:controller)
        
        return header
    }
    
    func collectionView(_ collectionView:UICollectionView, cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let controller:CSettings = self.controller as! CSettings
        let item:MSettingsProtocol = modelAtIndex(index:indexPath)
        let cell:VSettingsCell = collectionView.dequeueReusableCell(
            withReuseIdentifier:
            item.reusableIdentifier,
            for:indexPath) as! VSettingsCell
        cell.config(controller:controller)
        
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
