import UIKit

class MOptionReformaCrossingGameOverTimeOut:MOptionReformaCrossingGameOverProtocol
{
    var title:String
    {
        get
        {
            return NSLocalizedString("MOptionReformaCrossingGameOverTimeOut_title", comment:"")
        }
    }
    
    var descr:String
    {
        get
        {
            return NSLocalizedString("MOptionReformaCrossingGameOverTimeOut_descr", comment:"")
        }
    }
    
    var image:UIImage
    {
        get
        {
            return #imageLiteral(resourceName: "assetReformaCrossingPlayer11")
        }
    }
}
