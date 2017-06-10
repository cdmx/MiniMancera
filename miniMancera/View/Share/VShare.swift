import UIKit

class VShare:View, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    private weak var viewBar:VShareBar!
    private weak var collectionView:VCollection!
    private weak var spinner:VSpinner!
    private let kBarHeight:CGFloat = 64
    private let kCollectionBottom:CGFloat = 20
    
    required init(controller:UIViewController)
    {
        super.init(controller:controller)
        
        guard
            
            let controller:CShare = self.controller as? CShare
        
        else
        {
            return
        }
        
        let viewBar:VShareBar = VShareBar(controller:controller)
        self.viewBar = viewBar
        
        let spinner:VSpinner = VSpinner()
        spinner.stopAnimating()
        self.spinner = spinner
        
        let collectionView:VCollection = VCollection()
        collectionView.alwaysBounceVertical = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerCell(cell:VShareCellScale.self)
        collectionView.registerCell(cell:VShareCellGif.self)
        collectionView.registerCell(cell:VShareCellPng.self)
        self.collectionView = collectionView
        
        if let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.sectionInset = UIEdgeInsets(
                top:kBarHeight,
                left:0,
                bottom:kCollectionBottom,
                right:0)
        }
        
        addSubview(spinner)
        addSubview(collectionView)
        addSubview(viewBar)
        
        NSLayoutConstraint.topToTop(
            view:viewBar,
            toView:self)
        NSLayoutConstraint.height(
            view:viewBar,
            constant:kBarHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBar,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:collectionView,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:spinner,
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
    
    //MARK: private
    
    private func modelAtIndex(index:IndexPath) -> MShareContentProtocol
    {
        let controller:CShare = self.controller as! CShare
        let item:MShareContentProtocol = controller.model.content[index.item]
        
        return item
    }
    
    //MARK: public
    
    func startLoading()
    {
        collectionView.isHidden = true
        spinner.startAnimating()
        viewBar.isUserInteractionEnabled = false
    }
    
    func stopLoading()
    {
        collectionView.isHidden = false
        spinner.stopAnimating()
        viewBar.isUserInteractionEnabled = true
    }
    
    //MARK: collectionView delegate
    
    func collectionView(_ collectionView:UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAt indexPath:IndexPath) -> CGSize
    {
        let item:MShareContentProtocol = modelAtIndex(index:indexPath)
        let width:CGFloat = collectionView.bounds.maxX
        let size:CGSize = CGSize(width:width, height:item.cellHeight)
        
        return size
    }
    
    func numberOfSections(in collectionView:UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView:UICollectionView, numberOfItemsInSection section:Int) -> Int
    {
        guard
        
            let controller:CShare = self.controller as? CShare
        
        else
        {
            return 0
        }
        
        let count:Int = controller.model.content.count
        
        return count
    }
    
    func collectionView(_ collectionView:UICollectionView, cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let controller:CShare = self.controller as! CShare
        let item:MShareContentProtocol = modelAtIndex(index:indexPath)
        let cell:VShareCell = collectionView.dequeueReusableCell(
            withReuseIdentifier:
            item.reusableIdentifier,
            for:indexPath) as! VShareCell
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
