import UIKit

class VCreateCellFontName:VCreateCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    private weak var collectionView:VCollection!
    private let interVertical2:CGFloat
    private let interItem2:CGFloat
    private let kInterItem:CGFloat = 2
    private let kInterVertical:CGFloat = 8
    private let kVerticalSpace:CGFloat = 12
    private let kContentHorizontal:CGFloat = 20
    private let kCellWidth:CGFloat = 160
    private let kBorderHeight:CGFloat = 1
    
    private let kAfterAddRefresh:TimeInterval = 0.2
    
    override init(frame:CGRect)
    {
        interVertical2 = kInterVertical + kInterVertical
        interItem2 = kInterItem + kInterItem
        super.init(frame:frame)
        
        let borderTop:VBorder = VBorder(color:UIColor(white:0, alpha:0.1))
        let borderBottom:VBorder = VBorder(color:UIColor(white:0, alpha:0.1))
        
        let collectionView:VCollection = VCollection()
        collectionView.backgroundColor = UIColor(white:0.97, alpha:1)
        collectionView.alwaysBounceHorizontal = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerCell(cell:VCreateCellFontNameCell.self)
        self.collectionView = collectionView
        
        if let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.scrollDirection = UICollectionViewScrollDirection.horizontal
            flow.minimumLineSpacing = kInterItem
            flow.minimumInteritemSpacing = kInterItem
            flow.sectionInset = UIEdgeInsets(
                top:kInterVertical,
                left:kContentHorizontal,
                bottom:kInterVertical,
                right:kContentHorizontal)
        }
        
        addSubview(collectionView)
        addSubview(borderTop)
        addSubview(borderBottom)
        
        NSLayoutConstraint.equalsVertical(
            view:collectionView,
            toView:self,
            margin:kVerticalSpace)
        NSLayoutConstraint.equalsHorizontal(
            view:collectionView,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:borderTop,
            toView:collectionView)
        NSLayoutConstraint.height(
            view:borderTop,
            constant:kBorderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:borderTop,
            toView:collectionView)
        
        NSLayoutConstraint.bottomToBottom(
            view:borderBottom,
            toView:collectionView)
        NSLayoutConstraint.height(
            view:borderBottom,
            constant:kBorderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:borderBottom,
            toView:collectionView)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func config(controller:CCreate)
    {
        super.config(controller:controller)
        collectionView.reloadData()
        selectCurrentItem()
    }
    
    //MARK: private
    
    private func modelAtIndex(index:IndexPath) -> MCreateFontItem
    {
        let item:MCreateFontItem = controller!.model.font.fonts[index.item]
        
        return item
    }
    
    private func selectCurrentItem()
    {
        guard
            
            let selectedFont:Int = controller?.model.font.selectedFont
            
        else
        {
            return
        }
        
        let index:IndexPath = IndexPath(item:selectedFont, section:0)
        collectionView.selectItem(
            at:index,
            animated:true,
            scrollPosition:UICollectionViewScrollPosition.centeredHorizontally)
    }
    
    private func refreshFrame()
    {
        DispatchQueue.main.asyncAfter(
            deadline:DispatchTime.now() + kAfterAddRefresh)
        { [weak controller] in
            
            controller?.refreshFrame()
        }
    }
    
    //MARK: collectionView delegate
    
    func collectionView(_ collectionView:UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAt indexPath:IndexPath) -> CGSize
    {
        let height:CGFloat = collectionView.bounds.maxY - interVertical2
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
        
            let count:Int = controller?.model.font.fonts.count
        
        else
        {
            return 0
        }
        
        return count
    }
    
    func collectionView(_ collectionView:UICollectionView, cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let item:MCreateFontItem = modelAtIndex(index:indexPath)
        let cell:VCreateCellFontNameCell = collectionView.dequeueReusableCell(
            withReuseIdentifier:
            VCreateCellFontNameCell.reusableIdentifier,
            for:indexPath) as! VCreateCellFontNameCell
        cell.config(model:item)
        
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
        
        if controller.model.font.selectedFont == indexPath.item
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
        
        controller.model.font.selectedFont = indexPath.item
        refreshFrame()
    }
}
