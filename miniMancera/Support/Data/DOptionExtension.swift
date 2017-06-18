import Foundation

extension DOption
{
    //MARK: public
    
    func postScore(score:Int)
    {
        let score32:Int32 = Int32(score)
        
        if score32 > maxScore
        {
            maxScore = score32
        }
        
        DManager.sharedInstance?.save()
    }
}
