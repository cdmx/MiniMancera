import Foundation

class MOptionReformaCrossingTitle
{
    weak var view:VOptionReformaCrossingTitle?
    {
        didSet
        {
            updateString()
        }
    }
    
    private var levelString:String?
    
    //MARK: private
    
    private func updateString()
    {
        view?.text = levelString
    }
    
    //MARK: public
    
    func startLevel(level:Int)
    {
        let level:NSNumber = level as NSNumber
        levelString = String(
            format:String.localizedReformaCrossing(key:"MOptionReformaCrossingTitle_label"),
            level)
        updateString()
    }
}
