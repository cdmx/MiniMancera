import Foundation

class MOptionWhistlesVsZombiesHorde
{
    weak var viewFire:VOptionWhistlesVsZombiesFire?
    weak var viewTitle:VOptionWhistlesVsZombiesHordeTitle?
    
    //MARK: public
    
    func hide()
    {
        viewFire?.alpha = 0
        viewTitle?.alpha = 0
    }
    
    func show()
    {
        viewFire?.alpha = 1
        viewTitle?.alpha = 1
    }
}
