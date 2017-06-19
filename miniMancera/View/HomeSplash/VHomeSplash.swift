import UIKit

class VHomeSplash:View, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    private weak var collectionView:VCollection!
    private weak var viewOptions:VHomeSplashOptions!
    private let kImageHeight:CGFloat = 200
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
        
        let viewImage:VHomeSplashImage = VHomeSplashImage(controller:controller)
        let viewFooter:VHomeSplashFooter = VHomeSplashFooter(controller:controller)
        let viewOptions:VHomeSplashOptions = VHomeSplashOptions(controller:controller)
        self.viewOptions = viewOptions
        
        addSubview(viewImage)
        addSubview(viewOptions)
        addSubview(viewFooter)
        
        NSLayoutConstraint.topToTop(
            view:viewImage,
            toView:self)
        NSLayoutConstraint.height(
            view:viewImage,
            constant:kImageHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewImage,
            toView:self)
        
        NSLayoutConstraint.topToBottom(
            view:viewOptions,
            toView:viewImage)
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
}
