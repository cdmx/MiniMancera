import UIKit

class VCreate:View, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    private(set) weak var collectionView:VCollection!
    private weak var viewBar:VCreateBar!
    private weak var spinner:VSpinner!
    private weak var layoutBarTop:NSLayoutConstraint!
    private let kBarHeight:CGFloat = 64
    private let kCollectionBottom:CGFloat = 40
    
    required init(controller:UIViewController)
    {
        super.init(controller:controller)
        
        guard
            
            let controller:CCreate = controller as? CCreate
        
        else
        {
            return
        }
        
        let spinner:VSpinner = VSpinner()
        spinner.stopAnimating()
        self.spinner = spinner
        
        let viewBar:VCreateBar = VCreateBar(controller:controller)
        self.viewBar = viewBar
        
        let collectionView:VCollection = VCollection()
        collectionView.alwaysBounceVertical = true
        collectionView.registerCell(cell:VCreateCellTimeline.self)
        collectionView.registerCell(cell:VCreateCellCard.self)
        collectionView.registerCell(cell:VCreateCellDuration.self)
        collectionView.registerCell(cell:VCreateCellFontName.self)
        collectionView.registerCell(cell:VCreateCellFontSize.self)
        collectionView.registerCell(cell:VCreateCellBackground.self)
        collectionView.delegate = self
        collectionView.dataSource = self
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
        
        NSLayoutConstraint.equals(
            view:spinner,
            toView:self)
        
        layoutBarTop = NSLayoutConstraint.topToTop(
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
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    deinit
    {
        spinner.stopAnimating()
    }
    
    override func layoutSubviews()
    {
        collectionView.collectionViewLayout.invalidateLayout()
        
        super.layoutSubviews()
    }
    
    //MARK: private
    
    private func modelAtIndex(index:IndexPath) -> MCreateContentProtocol
    {
        let controller:CCreate = self.controller as! CCreate
        let item:MCreateContentProtocol = controller.model.content[index.item]
        
        return item
    }
    
    //MARK: public
    
    func startLoading()
    {
        viewBar.isUserInteractionEnabled = false
        collectionView.isHidden = true
        spinner.startAnimating()
    }
    
    //MARK: collectionView delegate
    
    func scrollViewDidScroll(_ scrollView:UIScrollView)
    {
        let offsetY:CGFloat = scrollView.contentOffset.y
        let usableOffset:CGFloat
        
        if offsetY < 0
        {
            usableOffset = 0
        }
        else
        {
            usableOffset = -offsetY
        }
        
        layoutBarTop.constant = usableOffset
    }
    
    func collectionView(_ collectionView:UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAt indexPath:IndexPath) -> CGSize
    {
        let item:MCreateContentProtocol = modelAtIndex(index:indexPath)
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
        let controller:CCreate = self.controller as! CCreate
        let count:Int = controller.model.content.count
        
        return count
    }
    
    func collectionView(_ collectionView:UICollectionView, cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let controller:CCreate = self.controller as! CCreate
        let item:MCreateContentProtocol = modelAtIndex(index:indexPath)
        let cell:VCreateCell = collectionView.dequeueReusableCell(
            withReuseIdentifier:
            item.reusableIdentifier,
            for:indexPath) as! VCreateCell
        cell.config(controller:controller)
        
        return cell
    }
    
    func collectionView(_ collectionView:UICollectionView, shouldSelectItemAt indexPath:IndexPath) -> Bool
    {
        return false
    }
    
    func collectionView(_ collectionView:UICollectionView,shouldHighlightItemAt indexPath:IndexPath) -> Bool
    {
        return false
    }
}
