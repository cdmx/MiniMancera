import UIKit

class CSettings:Controller<VSettings>
{
    let model:MSettings
    private let urlMap:[String:String]?
    private let kResourceName:String = "ResourceURL"
    private let kResourceExtension:String = "plist"
    private let kReviewKey:String = "review"
    private let kShareKey:String = "share"
    
    override init()
    {
        model = MSettings()
        
        guard
            
            let resourceUrl:URL = Bundle.main.url(
                forResource:kResourceName,
                withExtension:kResourceExtension),
            let urlDictionary:NSDictionary = NSDictionary(
                contentsOf:resourceUrl),
            let urlMap:[String:String] = urlDictionary as? [String:String]
            
        else
        {
            self.urlMap = nil
            
            super.init()
            
            return
        }
        
        self.urlMap = urlMap
        super.init()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: public
    
    func back()
    {
        guard
            
            let parent:ControllerParent = self.parent as? ControllerParent
        
        else
        {
            return
        }
        
        parent.pop(horizontal:ControllerParent.Horizontal.right)
    }
    
    func review()
    {
        guard
            
            let urlString:String = urlMap?[kReviewKey],
            let url:URL = URL(string:urlString)
            
        else
        {
            return
        }
        
        UIApplication.shared.openURL(url)
    }
    
    func share()
    {
        guard
            
            let urlString:String = urlMap?[kShareKey],
            let url:URL = URL(string:urlString)
            
        else
        {
            return
        }
        
        let activity:UIActivityViewController = UIActivityViewController(
            activityItems:[url],
            applicationActivities:nil)
        
        if let popover:UIPopoverPresentationController = activity.popoverPresentationController
        {
            popover.sourceView = view
            popover.sourceRect = CGRect.zero
            popover.permittedArrowDirections = UIPopoverArrowDirection.up
        }
        
        present(activity, animated:true)
    }
}
