import UIKit

class VHomeSplash:View, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    private weak var collectionView:VCollection!
    private weak var viewBackground:VHomeSplashBackground!
    private weak var viewOptions:VHomeSplashOptions!
    private let kOptionsHeight:CGFloat = 80
    
    required init(controller:UIViewController)
    {
        super.init(controller:controller)
        
        guard
        
            let controller:CHomeSplash = controller as? CHomeSplash
        
        else
        {
            return
        }
        
        let viewBackground:VHomeSplashBackground = VHomeSplashBackground(controller:controller)
        self.viewBackground = viewBackground
        let viewFooter:VHomeSplashFooter = VHomeSplashFooter(controller:controller)
        let viewOptions:VHomeSplashOptions = VHomeSplashOptions(controller:controller)
        self.viewOptions = viewOptions
        
        let collectionView:VCollection = VCollection()
        collectionView.alwaysBounceVertical = true
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.registerCell(cell:VHomeSplashCellDescr.self)
        self.collectionView = collectionView
        
        addSubview(viewBackground)
        addSubview(viewOptions)
        addSubview(viewFooter)
        addSubview(collectionView)
        
        NSLayoutConstraint.topToTop(
            view:viewBackground,
            toView:self)
        viewBackground.layoutHeight = NSLayoutConstraint.height(
            view:viewBackground,
            constant:viewBackground.kHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBackground,
            toView:self)
        
        NSLayoutConstraint.topToBottom(
            view:viewOptions,
            toView:viewBackground)
        NSLayoutConstraint.height(
            view:viewOptions,
            constant:kOptionsHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewOptions,
            toView:self)
        
        NSLayoutConstraint.topToBottom(
            view:viewFooter,
            toView:viewOptions)
        NSLayoutConstraint.bottomToBottom(
            view:viewFooter,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:viewFooter,
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
    
    private func modelAtIndex(index:IndexPath) -> MHomeSplashProtocol
    {
        let controller:CHomeSplash = self.controller as! CHomeSplash
        let item:MHomeSplashProtocol = controller.model.items[index.item]
        
        return item
    }
    
    //MARK: public
    
    func refresh()
    {
        viewOptions.refresh()
    }
    
    //MARK: collectionView delegate
    
    func scrollViewDidScroll(_ scrollView:UIScrollView)
    {
        let offsetY:CGFloat = scrollView.contentOffset.y
        var imageScaled:CGFloat = viewBackground.kHeight - offsetY
        
        if imageScaled < 0
        {
            imageScaled = 0
        }
        
        viewBackground.layoutHeight.constant = imageScaled
    }
    
    func collectionView(_ collectionView:UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAt indexPath:IndexPath) -> CGSize
    {
        let item:MHomeSplashProtocol = modelAtIndex(index:indexPath)
        let width:CGFloat = bounds.maxX
        let height:CGFloat = item.cellHeightFor(width:width)
        let size:CGSize = CGSize(width:width, height:height)
        
        return size
    }
    
    func numberOfSections(in collectionView:UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView:UICollectionView, numberOfItemsInSection section:Int) -> Int
    {
        let controller:CHomeSplash = self.controller as! CHomeSplash
        let count:Int = controller.model.items.count
        
        return count
    }
    
    func collectionView(_ collectionView:UICollectionView, cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let item:MHomeSplashProtocol = modelAtIndex(index:indexPath)
        let cell:VHomeSplashCell = collectionView.dequeueReusableCell(
            withReuseIdentifier:
            item.reusableIdentifier,
            for:indexPath) as! VHomeSplashCell
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
