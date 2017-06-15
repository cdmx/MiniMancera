import UIKit

class MOptionReformaCrossingGameOverTimeOut:MOptionReformaCrossingGameOverProtocol
{
    var title:String
    {
        get
        {
            return String.localizedReformaCrossing(key:"MOptionReformaCrossingGameOverTimeOut_title")
        }
    }
    
    var descr:String
    {
        get
        {
            return String.localizedReformaCrossing(key:"MOptionReformaCrossingGameOverTimeOut_descr")
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
