import UIKit

class VCreateCellTimelineFooter:UICollectionReusableView
{
    private weak var viewTimeline:VCreateCellTimeline?
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.setImage(
            #imageLiteral(resourceName: "assetGenericCreateAdd").withRenderingMode(UIImageRenderingMode.alwaysOriginal),
            for:UIControlState.normal)
        button.setImage(
            #imageLiteral(resourceName: "assetGenericCreateAddHover").withRenderingMode(UIImageRenderingMode.alwaysOriginal),
            for:UIControlState.highlighted)
        button.imageView!.clipsToBounds = true
        button.imageView!.contentMode = UIViewContentMode.center
        button.addTarget(
            self,
            action:#selector(actionAdd(sender:)),
            for:UIControlEvents.touchUpInside)

        addSubview(button)
        
        NSLayoutConstraint.equals(
            view:button,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: actions
    
    func actionAdd(sender button:UIButton)
    {
        UIApplication.shared.keyWindow!.endEditing(true)
        
        viewTimeline?.addFrame()
    }
    
    //MARK: public
    
    func config(viewTimeline:VCreateCellTimeline)
    {
        self.viewTimeline = viewTimeline
    }
}
