import UIKit

class MOptionReformaCrossingGameOverHitAndRun:MOptionReformaCrossingGameOverProtocol
{
    var title:String
    {
        get
        {
            return String.localizedReformaCrossing(key:"MOptionReformaCrossingGameOverHitAndRun_title")
        }
    }
    
    var descr:String
    {
        get
        {
            return String.localizedReformaCrossing(key:"MOptionReformaCrossingGameOverHitAndRun_descr")
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
