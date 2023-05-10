query 65501 "Customers With Bonuses"
{
    QueryType = Normal;

    elements
    {
        dataitem(Customer; Customer)
        {
            column(Count1)
            {
                Method = Count;
            }
            dataitem(BonusesFilter; "Bonus Header")
            {
                DataItemLink = "Customer No." = Customer."No.";
                SqlJoinType = InnerJoin;
            }
        }
    }
}