import UIKit

class VOptionWhistlesVsZombiesBoardCellScore:UICollectionViewCell
{
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        isUserInteractionEnabled = false
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: public
    
    func config(model:MOptionWhistlesVsZombiesBoardScoreItem)
    {
        
    }
}
