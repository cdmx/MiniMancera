import Foundation

extension DOptionPurchase
{
    //MARK: public
    
    func purchaseAction()
    {
        purchased = true
        
        DManager.sharedInstance?.save()
    }
}
