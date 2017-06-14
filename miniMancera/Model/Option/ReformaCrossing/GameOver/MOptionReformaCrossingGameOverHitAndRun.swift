import UIKit

class MOptionReformaCrossingGameOverHitAndRun:MOptionReformaCrossingGameOverProtocol
{
    var title:String
    {
        get
        {
            return NSLocalizedString("MOptionReformaCrossingGameOverHitAndRun_title", comment:"")
        }
    }
    
    var descr:String
    {
        get
        {
            return NSLocalizedString("MOptionReformaCrossingGameOverHitAndRun_descr", comment:"")
        }
    }
    
    var image:UIImage
    {
        get
        {
            return #imageLiteral(resourceName: "assetReformaCrossingPlayer10")
        }
    }
}
